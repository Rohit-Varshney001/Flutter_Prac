import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/pages/employes.dart';
import 'package:firebase_crud/service/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? EmployeeStream;
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  getOnTheLoad()async{
    EmployeeStream = await DatabaseMethods().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getOnTheLoad();
    super.initState();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Material(
                  elevation: 5.0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name : " + ds["Name"],
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    nameController.text = ds["Name"];
                                    ageController.text = ds["Age"];
                                    addressController.text = ds["Address"];

                                    EditEmployeeDetails(ds["Id"],context);
                                    },
                                    child: Icon(Icons.edit, color: Colors.orange,)),
                                SizedBox(width: 10,),
                                GestureDetector(child: Icon(Icons.delete, color: Colors.orange,),
                                onTap: ()async{
                                  showDeleteConfirmationDialog(context, ds["Id"]);

                                },
                                ),
                              ],
                            ),


                          ],
                        ),
                        Text(
                          "Age : "+ds["Age"],
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Location : "+ds["Address"],
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
        })
            : Container();
      },
      stream: EmployeeStream,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Employee()));
        },
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter ",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Firebase",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(children: [
          Expanded(child: allEmployeeDetails())
        ]),
      ),
    );

  }

  Future EditEmployeeDetails(String id,  context) => showDialog(context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(width: 10,),
                  Row(
                    children: [
                      Text(
                        "Edit ",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Details",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel)),


                ],
              ),
              SizedBox(height: 20.0,),
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

                    Map<String, dynamic> updateInfo ={
                      "Name":nameController.text.toString(),
                      "Age":ageController.text.toString(),
                      "Address" : addressController.text.toString(),
                      "Id":id
                    };

                    await DatabaseMethods.updateEmployeeDetail(id,updateInfo).then((value){
                      Navigator.pop(context);
                    });


                  },

                  child: Text("Update", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),))
              )



            ],
          ),
        ),
      );
    },);


  void showDeleteConfirmationDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Confirmation"),
          content: Text("Are you sure you want to delete?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    ).then((value) {
      // Handle the result of the dialog here
      if (value != null && value == true) {
        DatabaseMethods.deleteEmployeeDetail(id);
      }
    });
  }

}



