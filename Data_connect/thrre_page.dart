import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Contllor/coutter.dart';

class page243 extends StatefulWidget {
  const page243({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<page243> createState() => _page243State();
}

class _page243State extends State<page243> {
  @override
  Widget build(BuildContext context) {
    final conter c = Get.put(conter());

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     c.adddata();
      //   },
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextFormField(
          //   controller: c.name,
          // ),
          Center(
            child: Container(
              height: 80,
              width: 300,
              child: FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('products')
                    .doc(widget.id)
                    .get(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    var user6 = snapshot.data;
                    Map<String, dynamic> data1 =
                        user6!.data() as Map<String, dynamic>;
                    return Column(
                      children: [
                        Text(
                          'name :${data1['name']}',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'Mrp :${data1['Mrp']}',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'Price:${data1['Price']}',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'Description:${data1['Dec']}',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ),

          // TextButton(onPressed: () async{
          //
          //   var user7 = await FirebaseFirestore.instance.collection('products')
          //
          //
          //
          // }, child: Text("hy"))

          // Container(
          //   height: 100,
          //   width: 200,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container(
          //         height: 100,
          //         width: 300,
          //         child: GetBuilder<conter>(
          //           builder: (GetxController controller) {
          //             return Text('${c.User}');
          //           },
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
