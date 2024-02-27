import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculation Result"),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("BMI Score",style: TextStyle(
              fontSize: 25,
            fontWeight: FontWeight.w500
            ),),
          Text("23,6",style: TextStyle(
              fontSize: 65,
            fontWeight: FontWeight.bold,
            color: Colors.green
            ),),
          Text("Normal",style: TextStyle(
              fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.green
            ),),
          SizedBox(height: 45,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text('Gender:',
                    style:TextStyle(color: Colors.blue, fontSize: 18) ,),
                  SizedBox(width: 8),
                 Text("M"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text('Age:',style:TextStyle(color: Colors.blue, fontSize: 18) ,),
                  SizedBox(width: 8),
                  Text("32"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text('Height:',style:TextStyle(color: Colors.blue, fontSize: 18) ,),
                  SizedBox(width: 8),
                  Text("5'2"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text('Weight:',style:TextStyle(color: Colors.blue, fontSize: 18) ,),
                  SizedBox(width: 8),
                  Text("85"),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25,top: 10,bottom: 10),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow.shade800, width: 2),
                gradient: LinearGradient(
                  colors: [Colors.yellow.shade100, Colors.yellow.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Heading',
                    style: TextStyle(
                      color: Colors.yellow.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet consectetur adipiscing el',
                    style: TextStyle(
                      color: Colors.yellow.shade800,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              )
            ),
          )

        ],
      ),


    );
  }
}
