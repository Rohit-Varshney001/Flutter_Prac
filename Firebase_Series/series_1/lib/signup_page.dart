import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:series_1/homepage.dart';
import 'package:series_1/login_page.dart';
import 'package:series_1/uiHelper/ui_helper.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';




class SignUp_page extends StatefulWidget {
  const SignUp_page({super.key});

  @override
  State<SignUp_page> createState() => _SignUp_pageState();
}

class _SignUp_pageState extends State<SignUp_page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool isPasswordFieldFocused = false;
  bool passwordsMatch = true; // Flag to track if passwords match
  final GlobalKey<FlutterPwValidatorState> validatorKey = GlobalKey<FlutterPwValidatorState>();
  File? pickedImage;

  showAlertBox(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Pick iamge from : "),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
              leading: Icon(Icons.camera_alt),
              title: Text("Camera"),
            ),
            ListTile(
              onTap: (){
                pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
              leading: Icon(Icons.upload),
              title: Text("Gallery"),
            )
          ],
        ),
      );
    });
  }

  pickImage(ImageSource imageSource)async{
    try{
      final photo = await ImagePicker().pickImage(source: imageSource);
      if(photo == null)return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
    }catch(ex){
      log(ex.toString());
    }
  }


  uploadData()async{
    UploadTask uploadTask = FirebaseStorage.instance.ref("Profile Pics").child(emailController.text.toString()).putFile(pickedImage!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String URL = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance.collection("usersImage").doc(emailController.text.toString()).set({
      "Email" : emailController.text.toString(),
      "Image" : URL
    }).then((value){
      log("User Uploaded");
    });
  }


  signUp(String email, String password, String rePassword) async{
    if(email == "" || password == ""|| rePassword == ""){

      MotionToast.warning(
          title:  Text("Email/Password is Empty"),
          description:  Text("Type valid Email/Password")
      ).show(context);
    }else if(email.isNotEmpty) {
      bool isValid = EmailValidator.validate(email);
      if (isValid) {
        if (password != rePassword) {
          // If passwords don't match, set passwordsMatch flag to false
          MotionToast.warning(
              title:  Text("Password missmatched"),
              description:  Text("check password")
          ).show(context);
          passwordsMatch = false;
        } else {
          // Passwords match, proceed with sign up
          passwordsMatch = true;
          // Perform signup logic here

          UserCredential? userCredential;
          try{
            userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
              uploadData();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            });
          }
          on FirebaseAuthException catch(ex){
            MotionToast.info(
              title:  const Text(
                "Error SignUp",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              position: MotionToastPosition.center,
              description:  Text(ex.code.toString()),
            ).show(context);
          }

          print("Successful");


        }

      }else{
        MotionToast.warning(
            title:  Text("Ivalid Email"),
            description:  Text("Enter Valid Email")
        ).show(context);
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Page"),
        centerTitle:true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: showAlertBox,
                child: pickedImage != null ? ClipOval(
                  child: Image(
                    height: 200,
                    width: 200,
                    image: FileImage(pickedImage!),
                  ),
                ):
                ClipOval(
                  child: Image(
                    height: 200,
                    width: 200,
                    image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              UiHelper.customTextField(emailController, "Email", Icons.mail, false),

              Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    isPasswordFieldFocused = hasFocus;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordFieldFocused = true;
                    });
                  },
                  child: UiHelper.customTextField(passwordController, "Password", Icons.password, false,),
                ),
              ),
              if (isPasswordFieldFocused)
                FlutterPwValidator(
                  controller: passwordController,
                  minLength: 8,
                  uppercaseCharCount: 1,
                  numericCharCount: 1,
                  specialCharCount: 1,
                  width: 400,
                  height: 200,
                  onSuccess: () {
                    print("Success");
                  },
                  onFail: () {
                    print("Failed");
                  },
                ),

              UiHelper.customTextField(rePasswordController, "re-enter password", Icons.password, false),


              SizedBox(height: 30,),
              UiHelper.customButton(() {
                signUp(emailController.text.toString(), passwordController.text.toString(),rePasswordController.text.toString());

              }, "SignUp"),
              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account,",style: TextStyle(fontSize: 18),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                  }, child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)))
                ],
              )
            ],

          ),
        ),
      ),

    );
  }
}
