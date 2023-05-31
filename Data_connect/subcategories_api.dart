import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class subcategories_api extends StatefulWidget {
  const subcategories_api({Key? key, this.name}) : super(key: key);
  final name;

  @override
  State<subcategories_api> createState() => _subcategories_apiState();
}

class _subcategories_apiState extends State<subcategories_api> {
  var data12;

  Future<dynamic> Getdata() async {
    http.Response response = await http.get(
        Uri.parse('https://dummyjson.com/products/category/${widget.name}'));
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
                    height: 770,
                    width: 400,
                    child: GridView.builder(
                      itemCount: snapshot.data['products'].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: 180,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.brown),
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      '${snapshot.data['products'][index]['thumbnail']}',
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${snapshot.data['products'][index]['title']}',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${snapshot.data['products'][index]['price']}',
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 20,
                          mainAxisExtent: 220),
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
