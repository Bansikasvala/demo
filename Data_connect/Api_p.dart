import 'package:firebasedemo/Data_connect/Api_p1.dart';
import 'package:firebasedemo/Data_connect/categories_api.dart';
import 'package:firebasedemo/Model/Response/product_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api_p extends StatefulWidget {
  const api_p({Key? key}) : super(key: key);

  @override
  State<api_p> createState() => _api_pState();
}

class _api_pState extends State<api_p> {
  ProductResponseModel? data12;

  bool loading = false;

  Future Getdata(String value) async {
    setState(() {
      loading = true;
    });
    http.Response response = await http
        .get(Uri.parse('https://dummyjson.com/products/search?q=$value'));
    print('${response.body}');

    if (response.statusCode == 200) {
      data12 = productResponseModelFromJson(response.body);
      setState(() {
        loading = false;
      });
      // print('${data12[0]}');
    } else {
      print('Res${response.statusCode}');
      setState(() {
        loading = false;
      });
    }
  }

  final name12 = TextEditingController();

  @override
  initState() {
    Getdata('smartphones');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(14),
                    child: Text("Categories"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => categories_api(),
                            ));
                      },
                      child: Text("Categories")),
                  TextField(
                    controller: name12,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Getdata(name12.text);
                      },
                      child: Text("Categories")),
                  data12 == null
                      ? Center(
                          child: Text('No Data'),
                        )
                      : SizedBox(
                          height: 806,
                          width: 400,
                          child: GridView.builder(
                            itemCount: data12!.products.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Api_p(
                                                id: data12!.products[index].id),
                                          ));
                                    },
                                    child: Container(
                                      height: 180,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.brown),
                                        borderRadius: BorderRadius.circular(13),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              '${data12!.products[index].thumbnail}',
                                            ),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '${data12!.products[index].title}',
                                          style: TextStyle(
                                              fontSize: 8,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${data12!.products[index].price}',
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 20,
                                    mainAxisExtent: 220),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}
