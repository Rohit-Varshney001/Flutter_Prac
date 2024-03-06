import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/home_page.dart';
import 'package:todo_app/login_page.dart';


var username;

class CheckUser extends StatefulWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  late Widget _widgetToDisplay;

  @override
  void initState() {
    super.initState();
    _widgetToDisplay = Container(); // Initialize with a default value
    checkUser();
  }

  Future<void> checkUser() async {
    final user = FirebaseAuth.instance.currentUser;
    username = user?.uid;
    if (user != null) {
      _widgetToDisplay = HomePage();
    } else {
      _widgetToDisplay = LoginPage();
    setState(() {}); // Trigger a rebuild to display the correct widget
  }


}

  @override
  Widget build(BuildContext context) {
    return _widgetToDisplay;
  }
}