import 'package:flutter/material.dart';
import 'package:untitled1/const/textstyle.dart';


class paymentscreen extends StatefulWidget {
  const paymentscreen({Key? key}) : super(key: key);

  @override
  State<paymentscreen> createState() => _paymentscreenState();
}

class _paymentscreenState extends State<paymentscreen> {
  List image =[
    "asset/images/card1.png",
    "asset/images/card2.png",
    "asset/images/card3.png"

  ];
  final PageController pageController =PageController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 25,
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "Payment",
                  style: bw700,
                ),
              ],
            ),
           SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(children: List.generate(3, (index) => Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 14,),
                 child: Image.asset(image[index],height: 280,width: 280,),
               )),))

          ],
        ),
      ),
    );
  }
}
