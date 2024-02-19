import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:series_1/login_page.dart';
import 'package:series_1/show_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  logout()async{
    FirebaseAuth.instance.signOut().then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: ShowData(),
      floatingActionButton:  Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepOrange],
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.logout),
          onPressed: logout,
        ),
      )
    );
  }
}
