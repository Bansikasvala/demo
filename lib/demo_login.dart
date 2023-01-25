import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DemoLogin extends StatefulWidget {
  const DemoLogin({Key? key}) : super(key: key);

  @override
  State<DemoLogin> createState() => _DemoLoginState();
}

class _DemoLoginState extends State<DemoLogin> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final name = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            width: 200,
            child: TextFormField(
                controller: name,

            ),
          ),
          Container(

            height: 50,
            width: 200,
            child: TextFormField(
              controller: password,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                var user = await firebaseAuth.createUserWithEmailAndPassword(
                    email: name.text, password: password.text);
                print('${user.user!.displayName}');
              },
              child: Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}
