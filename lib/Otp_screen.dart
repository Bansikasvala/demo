import 'package:flutter/material.dart';
import 'package:untitled1/common_widget.dart';
import 'package:untitled1/const/color.dart';
import 'package:untitled1/const/textstyle.dart';

class otpscreen extends StatefulWidget {
  const otpscreen({Key? key}) : super(key: key);

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue.shade50,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: black,
                        )),
                  ),
                )
              ],
            ),
            buildSizedBox(height * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Verification Code",
                  style: bw500,
                )
              ],
            ),
            Image.asset("asset/images/lock.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  List.generate(4, (index) => optContainer(height, width)),
            ),
            buildSizedBox(height * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "00:20",
                      style: bw600,
                    ),
                    Text(
                      " resend confirmation code.",
                      style: greyw700,
                    )
                  ],
                )
              ],
            ),
            buildSizedBox(height * 6),
            commonMaterialButton(height , width,"Confirm")
          ],
        ),
      ),
    );
  }
}
