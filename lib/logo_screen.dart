import 'package:flutter/material.dart';

class logoscreen extends StatefulWidget {
  const logoscreen({Key? key}) : super(key: key);

  @override
  State<logoscreen> createState() => _logoscreenState();
}

class _logoscreenState extends State<logoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Center(child: Image.asset("asset/images/shop_logo.png",height: 120,width: 120,))
      ],),
    );
  }
}
