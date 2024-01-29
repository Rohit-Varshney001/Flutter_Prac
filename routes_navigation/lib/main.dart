import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routes_navigation/pages/homePage.dart';
import 'package:routes_navigation/pages/login.dart';
import 'package:routes_navigation/pages/signin.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      themeMode: ThemeMode.light,

      routes : {
        "/" : (context) => LoginPage(),
        "/login" : (context) => LoginPage(),
        "/signup" : (context) => SignUp(),
        "/homepage" : (context) => HomePage(),
    }


    );



  }
}
