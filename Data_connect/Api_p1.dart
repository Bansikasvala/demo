import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_p extends StatefulWidget {
  const Api_p({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<Api_p> createState() => _Api_pState();
}

class _Api_pState extends State<Api_p> {
  var data12;

  Future<dynamic> Getdata() async {
    http.Response response = await http
        .get(Uri.parse('https://dummyjson.com/products/${widget.id}'));
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: Getdata(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 400,
                      child: PageView(
                        children: List.generate(
                            snapshot.data['images'].length,
                            (index) => Container(
                                  height: 100,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.brown),
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(13),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          '${snapshot.data['images'][index]}',
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                )),

                        scrollDirection: Axis.horizontal,

                        // reverse: true,
                        // physics: BouncingScrollPhysics(),
                        // controller: controller,
                        onPageChanged: (num) {
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        '${snapshot.data['title']}',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Description       ${snapshot.data['description']}',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'DiscountPercentage         ${snapshot.data['discountPercentage']}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Rating           ${snapshot.data['rating']}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Stock            ${snapshot.data['stock']}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Brand            ${snapshot.data['brand']}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Category      ${snapshot.data['category']}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              } else {
                return Text("no");
              }
            },
          )
        ],
      ),
    );
  }
}
