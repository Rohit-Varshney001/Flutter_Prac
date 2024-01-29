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




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              height: 580,
              width: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly

                ,
                children: [
                  Text("Strawberry Pavlova",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  )),


                  Text("Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("*****",
                      style: TextStyle(
                        fontSize: 35,
                      ),),
                      Text("150 Reviews",
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                    ],
                  ),




                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("PREP:",
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 15,

                          ),),
                          Text("25 min"),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("COOK:",style: TextStyle(
                              color: Colors.lightBlueAccent,
                            fontSize: 15,
                          ),),
                          Text("1 hr"),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("FEEDS:",
                              style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 15,
                              ),),
                          Text("4-6"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
           InkWell(child: Image.asset('assets/images/java.png'),onLongPress: (){
             print("Long Pressed");
           },
           onTap: (){
             print("Pressed");
           },)

          ],
        ),
      )
    );
  }
}
