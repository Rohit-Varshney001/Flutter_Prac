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

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void pressed(){
    print("Button Pressed");
  }
  void longPressed(){
    print("Button Long Pressed");
  }
  void hover(){
    print("Button Hovered");
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:  Center(
        // child: TextButton(
        //   child: Text("Text Button"),
        //   onPressed: (){
        //     print("TextButton Pressed");
        //   },
        // ),
        // child: ElevatedButton(onPressed: pressed,
        //   onLongPress: longPressed,
        //   child: Text("Elevated Button"),
        // ),

        // child: OutlinedButton(
        //   child: Text("Outlined Button"),
        //   onPressed: pressed,
        //   onLongPress: longPressed,
        //
        // ),

        child: Container(
          height: 150,
          width: 150,
          child: Image.asset('assets/images/js.png'),)

      )

    );
  }
}
