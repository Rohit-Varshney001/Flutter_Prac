import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:series_1/forgot_password.dart';
import 'package:series_1/homepage.dart';
import 'package:series_1/signup_page.dart';
import 'package:series_1/uiHelper/ui_helper.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          }, child: Text("Forgot Password ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)))

        ],

      ),
    );
  }
}
