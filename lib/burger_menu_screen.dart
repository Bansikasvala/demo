import 'package:flutter/material.dart';

import 'common_widget.dart';

class burgermenu extends StatefulWidget {
  const burgermenu({Key? key}) : super(key: key);

  @override
  State<burgermenu> createState() => _burgermenuState();
}

class _burgermenuState extends State<burgermenu> {
  bool isclick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 100,
                color: Colors.black,
                width: double.infinity,
              ),

              commonListTile(const Icon(Icons.account_tree), const Text("abc")),
            ],
          ),
        ),
        appBar: AppBar(),
        body: Container());
  }
}
