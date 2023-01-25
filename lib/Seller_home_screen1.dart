import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/common_widget.dart';
import 'package:untitled1/const/color.dart';

import 'package:fab_circular_menu/fab_circular_menu.dart';

import 'const/textstyle.dart';

class Sellerhomescreen extends StatefulWidget {
  const Sellerhomescreen({Key? key}) : super(key: key);

  @override
  State<Sellerhomescreen> createState() => _SellerhomescreenState();
}

class _SellerhomescreenState extends State<Sellerhomescreen>
    with SingleTickerProviderStateMixin {
  String? selectedValue;
  List<String> item = [
    "seller mode",
    'Buyer mode',
  ];

  List<Map<String, dynamic>> card = [
    {
      'rs': '1,500',
      'name': 'Sales Today',
      'per': '12',
    },
    {
      'rs': '10',
      'name': 'Units Today',
      'per': '12',
    }
  ];
  List<Map<String, dynamic>> sale = [
    {
      'pr': '42%',
      'salename': "Prev Week",
      'icon': Icons.arrow_downward_sharp,
    },
    {
      'pr': '12%',
      'salename': "Overall",
      'icon': Icons.arrow_upward_outlined,
      'color': Colors.green
    }
  ];
  List<Map<String, dynamic>> icon = [
    {'icon': Icons.dashboard, 'name': "Dashboard"},
    {'icon': Icons.shopping_cart, 'name': "Orders"},
    {'icon': Icons.local_shipping_outlined, 'name': "Shipping"},
    {'icon': Icons.store, 'name': "Store"}
  ];
  int iconselect = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FabCircularMenu(
        fabCloseIcon: const Icon(Icons.close,color: white,
          size: 33,),
        fabColor: const Color(0xff8171CC),

         fabSize: 50,
        fabMargin: const EdgeInsets.symmetric(horizontal: 15, vertical: 45),
        ringColor: Colors.transparent,
        ringWidth: 165.0,
        ringDiameter: 380.0,
        fabOpenIcon: const Icon(
          Icons.add,
          color: white,
          size: 38,
        ),
        children: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.adf_scanner,
                color: p1,
              ),
              onPressed: () {
                // print('Favorite');
              }),
          IconButton(
              icon: const Icon(
                Icons.storefront,
                color: p1,
              ),
              onPressed: () {
                // print('Home');
              }),
          IconButton(
              icon: const Icon(
                Icons.photo_camera_outlined,
                color: p1,
              ),
              onPressed: () {}),
        ],
      ),
      bottomNavigationBar: Container(
        height: height * 0.1,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
            color: white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        iconselect = index;
                      });
                    },

                    child: Icon(
                      icon[index]['icon'],
                      color: iconselect == index ? Color(0xff8171CC) : Colors.grey,
                    ),
                  ),
                ),
                buildSizedBox(height * 0.1),
                Text(
                  icon[index]['name'],
                  style: iconselect == index ? bws12700 : greyw700,
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: p50,
                    child: Icon(Icons.menu, color: bwhite),
                  ),
                  Spacer(),
                  CustomDropdownButton2(
                      dropdownHeight: 100,
                      dropdownWidth: 120,
                      dropdownPadding: EdgeInsets.only(right: 10),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                      ),
                      hint: "Seller mode",
                      iconSize: 16,
                      buttonDecoration: BoxDecoration(
                          color: p50,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 4,
                            )
                          ]),
                      value: selectedValue,
                      buttonHeight: 30,
                      buttonWidth: 120,
                      dropdownItems: item,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      })
                ],
              ),
              buildSizedBox(height * 1),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      2,
                      (index) => CommonCard(
                            cardContainer(
                                height,
                                width,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          index == 0
                                              ? const Text(
                                                  "\$",
                                                  style: greyw700,
                                                )
                                              : const SizedBox(),
                                          Text(
                                            card[index]['rs'],
                                            style: bw700,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        card[index]['name'],
                                        style: greyw700,
                                      ),
                                    ],
                                  ),
                                )),
                          ))),
              buildSizedBox(height * 1),
              CommonCard(cardContainer(
                  height * 2,
                  width * 4,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Product Sales",
                            style: bwhitew500,
                          ),
                          buildSizedBox(height * 1),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        "\$",
                                        style: bwhitew500,
                                      ),
                                      buildSizedBox(height * 2.4),
                                      const Text(
                                        "49.2k",
                                        style: bw800,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Last Week",
                                    style: bwhitew500,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Row(
                                      children: List.generate(
                                    2,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: SaleContainer(
                                          height * 1.1,
                                          width * 1,
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        sale[index]['icon'],
                                                        color: index == 1?green:red,
                                                      ),
                                                      Text(
                                                        sale[index]['pr'],
                                                        style: index== 1? greenw600:redw600,
                                                      )
                                                    ],
                                                  ),
                                                  buildSizedBox(height * 0.2),
                                                  Text(
                                                    sale[index]['salename'],
                                                    style: index== 1? greenw500:redw500 ,
                                                  )
                                                ],
                                              ),


                                            ],
                                          )),
                                    ),
                                  )),
                                ],
                              )
                            ],
                          ),
                        ]),
                  ))),
              buildSizedBox(height * 1),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  cardContainer(
                      height * 4,
                      width * 4,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "New Order",
                                  style: bwhitew500,
                                ),
                                Icon(Icons.more_vert)
                              ],
                            )
                          ],
                        ),
                      )),
                  // Positioned(
                  //     bottom: -12,
                  //     right: -6,
                  //     child: )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
