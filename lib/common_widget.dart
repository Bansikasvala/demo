import 'package:flutter/material.dart';

import 'const/color.dart';
import 'const/textstyle.dart';
Container cardContainer(double height, double width, Widget child) {
  return Container(
    height: height * 0.09,
    width:  width * 0.18,

    decoration: BoxDecoration(
        color: p50,
        borderRadius: BorderRadius.circular(11)

    ),
    child: child,
  );
}
SizedBox buildSizedBox(double height) {
  return SizedBox(
    height: height * 0.025,
  );
}
Card CommonCard( Widget child) {
  return Card(
      shadowColor: Colors.grey.shade400,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12) ),
  child: child,

  );}
Container SaleContainer(double height, double width , Widget child) {
  return Container(
    height:  height * 0.07,
    width: width * 0.1,

    decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(11)

    ),
    child:  child,
  );
}
Container optContainer(double height, double width) {
  return Container(
    height: height * 0.13,
    width: width * 0.090,
    margin: EdgeInsets.only(left: 7),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300,)
    ),
  );
}
MaterialButton commonMaterialButton(double height, double width , String title) {
  return MaterialButton(
    height: height *0.06,
    minWidth: width * 0.38,
    color: p1,
    shape: StadiumBorder(),
    child:  Text(title,style: w500,),
    onPressed: () {

    },);
}
ListTile commonListTile(Widget child , Widget Text) {
  return  ListTile(
    leading:  child,
    title: Text,
  );
}