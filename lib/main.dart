import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:untitled1/Otp_screen.dart';
import 'package:untitled1/Payment_Screen.dart';
import 'package:untitled1/Seller_home_screen1.dart';
import 'package:untitled1/burger_menu_screen.dart';
import 'package:untitled1/demo.dart';
import 'package:untitled1/demo_login.dart';
import 'package:untitled1/logo_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sellerhomescreen(),
    );
  }
}


