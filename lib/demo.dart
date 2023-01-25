import 'dart:async';

import 'package:flutter/material.dart';
class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
 Future <List<dynamic>> demo()async{
   return await Future.delayed(Duration(seconds: 3),(){
     return name;

   });
 }
 StreamController<List<dynamic>> streamController = StreamController<List<dynamic>>();
 List name = [
   'name',
   'naj',
   'suryak'
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FabCircularMenu(
      //
      //     ringColor: Colors.transparent,
      //   fabOpenIcon: Icon(Icons.add),
      //     children: <Widget>[
      //       IconButton(icon: Icon(Icons.home), onPressed: () {
      //         print('Home');
      //       }),
      //       IconButton(icon: Icon(Icons.favorite), onPressed: () {
      //         print('Favorite');
      //       })
      //     ],
      // ),
      body: Column(
        children: [
               StreamBuilder(
                 stream: streamController.stream,
                 builder: (context, snapshot) {
                  // if(snapshot.hasData)
                  //   {
                  //     streamController.sink.toString();
                  //   }
                  // else{
                  //
                  // }

                   return Text('');
               },)

        ],
      ),
    );
  }
}
