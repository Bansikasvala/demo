import 'dart:convert';

import 'package:firebasedemo/Data_connect/subcategories_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class categories_api extends StatefulWidget {
  const categories_api({Key? key}) : super(key: key);

  @override
  State<categories_api> createState() => _categories_apiState();
}

class _categories_apiState extends State<categories_api> {
  var data12;

  Future<dynamic> Getdata() async {
    http.Response response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    print('${response.body}');

    if (response.statusCode == 200) {
      data12 = jsonDecode(response.body);
      // print('${data12[0]}');
      return data12;
    } else {
      print('Res${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: FutureBuilder(
              future: Getdata(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    height: 700,
                    width: 400,
                    child: GestureDetector(
                      onTap: () {},
                      child: ListView.separated(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => subcategories_api(
                                      name: snapshot.data['name'],
                                    ),
                                  ));
                            },
                            child: Text(
                              '${snapshot.data[index]}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
