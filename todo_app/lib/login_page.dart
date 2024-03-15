import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/forgot_password_page.dart';
import 'package:todo_app/home_page.dart';
import 'package:todo_app/sign_up_page.dart';
import 'package:todo_app/uiHelper/ui_helper.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';



var name;
var user_name_login;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password)async{
    if(email == "" || password == "") {
      MotionToast.warning(
          title: Text("Email/Password is Empty"),
          description: Text("Type valid Email/Password")
      ).show(context);
    }else{
      UserCredential? userCredential;
      try{
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          name = value.user?.uid;
          user_name_login = value.user?.email;
          user_name_login = user_name_login.toString().length > 7 ? value.user?.email.toString().substring(0, 7).toUpperCase():value.user?.email.toString().toUpperCase();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        });
      }
      on FirebaseAuthException catch(ex){
        MotionToast.info(
          title:  const Text(
            "Error login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          position: MotionToastPosition.center,
          description:  Text("Wrong Email/Password"),
        ).show(context);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,


      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/loginLogo.png"),
            SizedBox(height: 15,),


            UiHelper.customTextField(emailController, "Email", Icons.mail, false),
            UiHelper.customTextField(passwordController, "Password", Icons.password, true),
            SizedBox(height: 30,),
            UiHelper.customButton(() {
              login(emailController.text.toString(), passwordController.text.toString());
            }, "Login"),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an Account,",style: TextStyle(fontSize: 18),),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp_page()),);
                }, child: Text("SignUp",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))),


              ],
            ),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()),);
            }, child: Text("Forgot Password ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))),



          ],

        ),
      ),
    );
  }
}
