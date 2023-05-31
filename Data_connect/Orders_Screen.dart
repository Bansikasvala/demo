import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/Data_connect/thrre_page.dart';
import 'package:flutter/material.dart';

class orders_screen extends StatefulWidget {
  const orders_screen({Key? key}) : super(key: key);

  @override
  State<orders_screen> createState() => _orders_screenState();
}

class _orders_screenState extends State<orders_screen>
    with SingleTickerProviderStateMixin {
  var user1 = FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 480,
            width: 400,
            child: FutureBuilder<QuerySnapshot>(
              future: user1.get(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        width: 340,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> data1 =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Text(
                                      '${data1['name']}',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      var data2 = await user1.doc(
                                          '${snapshot.data.docs[index].id}');

                                      dynamic idkey = data2.id;
                                      print('doc id ${idkey}');

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  page243(id: idkey)));
                                    },
                                    child: Icon(Icons.arrow_forward,
                                        color: Colors.black, size: 22),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                  "=========================================="),
                            );
                          },
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
