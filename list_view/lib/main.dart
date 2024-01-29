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
  var arr = ["Rohit", "Rohit2", "Rohit3", "Rohit4", "Rohit5","Rohit6", "Rohit7", "Rohit8"];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:  Center(
        
        child: ListView.separated(itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(arr[index], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(arr[index], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(arr[index], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),),
              ),
            ],
          );
        },
        itemCount: arr.length,
          separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 5,thickness: 5,);
          },
        ),
        
        
        // child: ListView(
        //   scrollDirection: Axis.horizontal,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Text1", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Text2", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Text3", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Text4", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Text5", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Text6", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Text6", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Text6", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),),
        //     ),
        //   ],
        // ),

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // child: SingleChildScrollView(
        //   child: Column(
        //    children: [
        //      Container(height: 150,width: 150, color: Colors.red,
        //      child: Center(child: Text("Text1",)),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.green,
        //        child: Center(child: Text("Text2")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.blue,
        //        child: Center(child: Text("Text3")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.yellow,
        //        child: Center(child: Text("Text4")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.indigo,
        //        child: Center(child: Text("Text5")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.grey,
        //        child: Center(child: Text("Text6")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.red,
        //        child: Center(child: Text("Text7")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.green,
        //        child: Center(child: Text("Text8")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.blue,
        //        child: Center(child: Text("Text9")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.yellow,
        //        child: Center(child: Text("Text10")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.indigo,
        //        child: Center(child: Text("Text11")),
        //      ),
        //      Container(height: 150,width: 150, color: Colors.grey,
        //        child: Center(child: Text("Text12")),
        //      ),
        //    ],
        //
        //
        //   ),
        // ),
      ),
    );
  }
}
