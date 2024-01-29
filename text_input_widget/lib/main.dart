import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  // TextEditingController emailTxt, passwordTxt;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

var passwordTxt = TextEditingController();
var emailTxt = TextEditingController();
var obscureText = true;
var passwordIconShow = Icon(Icons.remove_red_eye_outlined, color: Colors.greenAccent,);
var passwordIconHide = Icon(Icons.remove_red_eye, color: Colors.greenAccent,);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailTxt,
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.email, color: Colors.greenAccent,),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      )
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.greenAccent
                      )
                    )
                  ),
                ),
                Container(height: 15,),
                TextField(
                  controller: passwordTxt,
                  obscureText: obscureText,

                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),

                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;

                        });
                      },
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.deepOrange,

                      )
                    ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: Colors.greenAccent,
                            width: 2
                          )
                      )

                  ),
                ),
                Container(height: 15,),

                ElevatedButton(onPressed: (){
                  String uEmail = emailTxt.text;
                  String uPass = passwordTxt.text;
                  print(passwordTxt.text);
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text("Email:  $uEmail, \n Password: $uPass"),
                  ));
                }, child: Text("Submit"))

              ],
            )),

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
