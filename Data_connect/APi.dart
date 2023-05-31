import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api extends StatefulWidget {
  const api({Key? key}) : super(key: key);

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  Future<dynamic> Getdata() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    print('${response.body}');

    if (response.statusCode == 200) {
      var data12;
      data12 = jsonDecode(response.body);
      // print('${data12[0]}');
      return data12;
    } else {
      print('Res${response.statusCode}');
    }
  }

  initState() {
    Getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: Getdata(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 780,
                  width: 400,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        trailing: Text(
                          'complete:${snapshot.data[index]['completed']}',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        title: Text('Title: ${snapshot.data[index]['title']}',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        leading: Text(
                            'Userid: ${snapshot.data[index]['userId']}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('Id: ${snapshot.data[index]['id']}',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold)),
                      );
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
