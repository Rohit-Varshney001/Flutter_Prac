import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue
      ),
      home: const MyHomePage(title: 'Flutter Container'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: Container(
          color: Colors.grey,
          height: 150,
          width: 150,
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: const Text("Sample Text\ndsanjfk",
              style: TextStyle(
                fontSize: 20,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white),
                  textAlign: TextAlign.center),


            ),
          ),
        ),
      )

    );

  }
}
