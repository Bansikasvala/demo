import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class page23 extends StatefulWidget {
  const page23({
    Key? key,
  }) : super(key: key);

  @override
  State<page23> createState() => _page23State();
}

class _page23State extends State<page23> {
  GoogleSignIn googleSignIn = GoogleSignIn();
  int? resendToken;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ImagePicker picker = ImagePicker();
  File? image;
  var storage = FirebaseStorage.instance;
  int imagenumber = 0;

  List<File> imagelist = [];

  List<String> urls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 600,
          width: 400,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 100,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12),
            itemCount: imagelist.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(19)),
                child: Image.file(
                  imagelist[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: () async {
            XFile? SelectImage =
                await picker.pickImage(source: ImageSource.gallery);
            setState(() {
              image = File(SelectImage!.path);
              imagelist.add(image!);
            });
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.camera_alt_outlined),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              imagelist.forEach((element) async {
                storage
                    .ref('$imagenumber.png')
                    .putFile(imagelist[imagenumber++])
                    .then((p0) async {
                  String url = await p0.ref.getDownloadURL();
                  urls.add(url);
                  url = "";
                  imagenumber++;
                  print('${'URL ======$imagenumber $urls'}');

                  print('URL${url}');
                });
              });
            },
            child: Text("Upload image"))
      ],
    ));
  }
}
