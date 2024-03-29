import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:series_1/login_page.dart';
import 'package:series_1/uiHelper/ui_helper.dart';

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
      MotionToast.info(
        title:  const Text(
          "Sent Successfully",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        position: MotionToastPosition.center,
        description:  Text("If email is correct then check you mail"),
      ).show(context);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){

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
          ClipOval(
            child: Image(
              height: 200,
              width: 200,
              image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
            ),
          ),
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
