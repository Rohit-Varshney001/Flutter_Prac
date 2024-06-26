import 'package:chat_wave/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../uiHelper/ui_helper.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  forgotPassword(String email) async{
    if(email == ""){
      MotionToast.warning(
          title: Text("Email is Empty"),
          description: Text("Type valid Email")
      ).show(context);

    }else{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
        MotionToast.info(
          title:  const Text(
            "Sent Successfully",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          position: MotionToastPosition.center,
          description:  Text("Please check you inbox"),
        ).show(context);


        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));

      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Forgot Password"),
        centerTitle: true,),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/loginLogo.png"),
          SizedBox(height: 30,),
          UiHelper.customTextField(emailController, "Email", Icons.email, false),
          SizedBox(height: 20,),
          UiHelper.customButton(() {
            forgotPassword(emailController.text.toString());
          }, "Reset Password"),
        ],
      ),

    );
  }
}