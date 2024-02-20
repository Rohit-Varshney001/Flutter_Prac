import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DatabaseMethods{
  static Future addEmployeeDetails(Map<String, dynamic> employeeInfoMap, String id)async{
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails()async{
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  static Future updateEmployeeDetail(String id, Map<String, dynamic> updateInfoMap)async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).update(updateInfoMap);
  }
  static Future deleteEmployeeDetail(String id)async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).delete();
  }

}