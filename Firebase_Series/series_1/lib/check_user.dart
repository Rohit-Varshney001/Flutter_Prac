import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:series_1/homepage.dart';
import 'package:series_1/login_page.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkUser();
  }

  checkUser()async{
    final user = FirebaseAuth.instance.currentUser;
    if(user != null){
      return HomePage();
    }else{
      return LoginPage();
    }
  }


}
