import 'package:bmi_app/result_page.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import 'drop_down.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

double? calculateBMI(String selected_weight_val, String selected_height_val,
    int weight, int heightCM, int heightIN) {
  double? heightM;
  double? weightKG;

  if (selected_height_val == "Cm.") {
    heightM = heightCM * 0.01;
  } else {
    heightIN += heightCM * 12;
    heightM = heightIN * 0.0254;
  }

  if (selected_weight_val == "Lbs.") {
    weightKG = weight * 0.453592;
  } else {
    weightKG = weight.toDouble();
  }

  if (heightM != null && weightKG != null) {
    double result = weightKG / (heightM * heightM);
    return result;
  } else {
    return null;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String imagePath = "assets/images/men.png";
  String selected_weight_val = "Lbs.";
  String selected_height_val = "Cm.";
  final List<String> heightOptions = ['Cm.', 'Ft.'];
  final List<String> weightOptions = ['Lbs.', 'Kg.'];
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightControllerCM = TextEditingController();
  TextEditingController heightControllerIN = TextEditingController();

  Widget _buildIconButton(IconData iconData, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: _selectedIndex == index
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          icon: Icon(
            iconData,
            color: Colors.red,
            size: 35,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'BMI',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'Calculator',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 80,
                  width: 80,
                  child: ClipOval(
                    child: _selectedIndex == 0
                        ? Image.asset("assets/images/profile_logo.png")
                        : Image.asset("assets/images/profile_logo2.png"),
                    clipBehavior: Clip.hardEdge,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 600,
                  width: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: _selectedIndex == 0
                        ? AssetImage("assets/images/men.png")
                        : AssetImage("assets/images/women.png"),
                    fit: BoxFit.fitHeight,
                  )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildIconButton(Icons.male, 0),
                        _buildIconButton(Icons.female, 1),
                      ],
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      // height: , // Set the desired height
                      width: 120, // Set the desired width
                      child: TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: "Age"),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        DropdownButtonExample(
                          list: heightOptions,
                          onChanged: (String value) {
                            setState(() {
                              selected_height_val = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: selected_height_val == "Ft."
                              ? 60
                              : 120, // Set the desired width
                          child: TextField(
                            controller: heightControllerCM,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  selected_height_val == "Ft." ? "Ft." : "CM.",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Visibility(
                          visible: selected_height_val ==
                              'Ft.', // Set visibility based on selected value
                          child: Container(
                            // margin: EdgeInsets.only(left: 10),
                            width: 60,
                            child: TextField(
                              controller: heightControllerIN,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Inch.',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        DropdownButtonExample(
                          list: weightOptions,
                          onChanged: (String value) {
                            setState(() {
                              selected_weight_val = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 120, // Set the desired width
                          child: TextField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  selected_weight_val == "Kg." ? "Kg." : "Lbs.",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: () {
                int weight = int.tryParse(weightController.text) ?? 0;
                int heightCM = int.tryParse(heightControllerCM.text) ?? 0;
                int heightIN = int.tryParse(heightControllerIN.text) ?? 0;

                double? bmiResult = calculateBMI(selected_weight_val,
                    selected_height_val, weight, heightCM, heightIN);

                if (!bmiResult!.isNaN) {
                  print("BMI: $bmiResult");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              ageController.text.toString(),
                              _selectedIndex == 0 ? "Male" : "Female",
                              heightControllerCM.text.toString(),
                              heightControllerIN.text.toString(),
                              weightController.text.toString(),
                              bmiResult,
                              selected_height_val.toString(),
                              selected_weight_val.toString(),
                          )));
                } else {

                  MotionToast.warning(
                      title:  Text("Warning"),
                      description:  Text("Invalid Input")
                  ).show(context);
                }
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[800]!, Colors.blue[400]!],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
