import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class one_page extends StatefulWidget {
  const one_page({Key? key}) : super(key: key);

  @override
  State<one_page> createState() => _one_pageState();
}

class _one_pageState extends State<one_page> {
  var user = FirebaseFirestore.instance.collection('Buyer_User').doc().get();
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Buyer_User').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      height: 700,
                      width: 360,
                      child: ListView.builder(

                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> data = snapshot.data?.docs[index]
                              .data() as Map<String, dynamic>;

                          return Container(
                            height: 110,
                            width: 200,
                            color: Colors.red,
                            margin: EdgeInsets.only(bottom: 12),
                            child: Row(
                              children: [
                                Text('${data['name']}'),
                                PopupMenuButton(itemBuilder: (context) => [
                                  PopupMenuItem(child: GestureDetector(
                                    onTap: () {
                                    showDialog(context: context, builder: (BuildContext context) {
                                      return SimpleDialog(

                                        backgroundColor: Colors.black,

                                        children: [
                                         Container(
                                           height: 70,
                                           width: 200,
                                           color: Colors.red,
                                           child:   Column(
                                             children: [
                                               Text('name ${data['name']}'),
                                               TextField(
                                                 controller: name,
                                               ),
                                               ElevatedButton(onPressed: , child: child)
                                             ],

                                           ),
                                         )
                                        ],


                                      );
                                    }, );
                                    },
                                      child: Text('update')




                                  )


                                  ),
                                  PopupMenuItem(child: Text('delete'))
                                ],)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    'name': '223',
                    'email': 'ew',
                  };

                  FirebaseFirestore.instance
                      .collection('Buyer_User')
                      .doc()
                      .set(data);
                },
                child: Text('get')),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    'name': '223',
                    'email': 'ew',
                  };

                  FirebaseFirestore.instance
                      .collection('Buyer_User')
                      .doc()
                      .set(data);
                },
                child: Text('add')),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    'name': '223',
                    'email': 'ew',
                  };

                  FirebaseFirestore.instance
                      .collection('Buyer_User')
                      .doc('Bg81Lw58YtZobj5KeYMb')
                      .delete();
                },
                child: Text('delete')),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    'name': '223',
                    'email': 'ew',
                  };

                  FirebaseFirestore.instance
                      .collection('Buyer_User')
                      .doc()
                      .set(data);
                },
                child: Text('update')),
          ],
        ),
      ),
    );
  }
}
