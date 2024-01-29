import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: DashBoardScreen(),
    );
  }

}
class DashBoardScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),


      ),


      // body: Container(
      //   color: Colors.black,
      //   child: Center(
      //     child: Container(
      //       width: 150,
      //       height: 150,
      //       decoration: BoxDecoration(
      //         color: Colors.blueGrey,
      //         borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.elliptical(25 ,10)),
      //         border: Border.all(
      //           color: Colors.grey,
      //           width: 2,
      //         ),
      //         boxShadow: [
      //           BoxShadow(
      //             spreadRadius: 10,
      //             blurRadius: 12,
      //             color: Colors.blueGrey
      //
      //           )
      //         ],
      //         // shape: BoxShape.circle
      //
      //       ),
      //     ),
      //   ),
      // ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.lightGreen,
            ),
          ),
          Expanded(
            flex: 2,
            
            child: Container(
              width: 150,
              height: 150,
              color: Colors.amberAccent,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: 150,
              height: 150,
              color: Colors.tealAccent,
            ),
          )
        ],
      ),

    );
  }
  
}
