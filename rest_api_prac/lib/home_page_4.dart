import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;


class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print("No image selected");
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });
    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse("https://fakestoreapi.com/products");

    var request = new http.MultipartRequest('POST', uri);
    request.fields['title'] = "Static title";
    var multipart = new http.MultipartFile('image', stream, length);

    request.files.add(multipart);

    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      print('Image Uploaded');
    } else {
      print('Image Uploaded');
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Upload Image"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: image == null
                  ? Center(
                      child: GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Text("PickImage")),
                    )
                  : Container(
                      child: Center(
                        child: Image.file(
                          File(image!.path).absolute,
                          height: 100,
                          width: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: Center(
                  child: Text("Upload Image"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
