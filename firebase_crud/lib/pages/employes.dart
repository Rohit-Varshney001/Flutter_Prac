import 'package:firebase_crud/service/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Employee ",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Form",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0,right : 20.0 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text ("Name", style: TextStyle (color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox (height: 10.0),
              Container(
                padding: EdgeInsets.only (left: 10.0),
                decoration: BoxDecoration (
                    border: Border.all(), borderRadius: BorderRadius.circular (10)
                ), // BoxDecoration
                child: TextField(
                  controller: nameController,
                    decoration: InputDecoration (border: InputBorder.none, hintText: "Name"),

              ),
            ),
            SizedBox(height: 15.0,),

            Text ("Age", style: TextStyle (color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox (height: 10.0),
              Container(
                padding: EdgeInsets.only (left: 10.0),
                decoration: BoxDecoration (
                    border: Border.all(), borderRadius: BorderRadius.circular (10),
                ), // BoxDecoration
                child: TextField(
                  controller: ageController,
                    decoration: InputDecoration (border: InputBorder.none,hintText: "Age"),
              ),
            ),
            SizedBox(height: 15.0,),
            Text ("Address", style: TextStyle (color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox (height: 10.0),
              Container(
                padding: EdgeInsets.only (left: 10.0),
                decoration: BoxDecoration (
                    border: Border.all(), borderRadius: BorderRadius.circular (10)
                ), // BoxDecoration
                child: TextField(
                  controller: addressController,
                    decoration: InputDecoration (border: InputBorder.none, hintText: "Location"),
              ),
            ),
            SizedBox (height: 20.0),
            Center(child: ElevatedButton(
                onPressed: ()async{
                  String Id = randomAlphaNumeric(10);
              Map<String, dynamic> employeeInfoMap = {
                "Name" : nameController.text,
                "Age" : ageController.text,
                "Id" : Id,
                "Address" : addressController.text,
              };
              await DatabaseMethods.addEmployeeDetails(employeeInfoMap,Id).then((value) => {
                print("OK")
                // Fluttertoast.showToast(
                //   msg: "Employee details has been added successfully",
                //   toastLength: Toast.LENGTH_SHORT,
                //   gravity: ToastGravity.CENTER,
                //   timeInSecForIosWeb: 1,
                //   backgroundColor: Colors.red,
                //   textColor: Colors.white,
                //   fontSize: 16.0
                // )

              });
            }, child: Text("Add", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),)))

          ],
        ),
      ),
    );
  }
}
