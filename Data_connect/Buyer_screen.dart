import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class buyer_screen extends StatefulWidget {
  const buyer_screen({Key? key}) : super(key: key);

  @override
  State<buyer_screen> createState() => _buyer_screenState();
}

class _buyer_screenState extends State<buyer_screen> {
  final name = TextEditingController();
  final Product = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buyer"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: name,
          ),
          TextFormField(
            controller: Product,
          ),
          ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> add = {
                  'name': '${name.text}',
                  'product_id': '${Product.text}'
                };

                var newDocRef =
                    FirebaseFirestore.instance.collection('demoproduct').doc();
                var newDocId = newDocRef.id;
                newDocRef.set(add);
                print(newDocId);
              },
              child: Text("Send orders"))
        ],
      ),
    );
  }
}
