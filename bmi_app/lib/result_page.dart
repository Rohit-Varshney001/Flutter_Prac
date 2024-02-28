import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String Age;
  final String Gender;
  final String heightCm,
      heightIn,
      weight;
  final double result;
  final String selected_weight_val,
      selected_height_val;
  const ResultPage(
      this.Age,
      this.Gender,
      this.heightCm,
      this.heightIn,
      this.weight,
      this.result,
      this.selected_height_val,
      this.selected_weight_val,
      {Key? key})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String resultString = "";

  @override
  void initState() {
    super.initState();
    FindResultString();
  }

  void FindResultString() {
    if (widget.result <= 18.5) {
      resultString = "UnderWeight";
    } else if (widget.result > 18.5 && widget.result < 25) {
      resultString = "Normal";
    } else if (widget.result >= 25 && widget.result <= 30) {
      resultString = "OverWeight";
    } else if (widget.result > 30) {
      resultString = "Obesity";
    }
  }

  Color getColorForResultString(String resultString) {
    switch (resultString) {
      case "UnderWeight":
        return Colors.blue; // Change color to your preference
      case "Normal":
        return Colors.green; // Change color to your preference
      case "OverWeight":
        return Colors.orange; // Change color to your preference
      case "Obesity":
        return Colors.red; // Change color to your preference
      default:
        return Colors.black; // Default color if resultString doesn't match any case
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculation Result"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "BMI Score",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          Text(
            widget.result.toStringAsFixed(2),
            style: TextStyle(
                fontSize: 65, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Text(
            resultString,
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: getColorForResultString(resultString)),
          ),
          SizedBox(
            height: 45,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Gender:',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  Text("${widget.Gender}"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Age:',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  Text("${widget.Age}"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Height:',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  Text(widget.selected_height_val != "Cm."
                      ? "${widget.heightCm} Ft.' ${widget.heightIn} Inch"
                      : "${int.parse(widget.heightCm) * 0.01} Mtr. '"),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Weight:',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  Text(widget.selected_weight_val != "Lbs."
                      ? "${widget.weight} Kg"
                      : "${widget.weight} Lbs"),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 10, bottom: 10),
            child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.yellow.shade800, width: 2),
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellow.shade100,
                      Colors.yellow.shade400
                    ],
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
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
