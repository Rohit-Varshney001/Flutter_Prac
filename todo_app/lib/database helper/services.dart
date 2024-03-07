
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class DatabaseMethods {
  Future<Stream<QuerySnapshot>> getEmployeeDetails(String collectionName)async{
    print(FirebaseFirestore.instance.collection(collectionName).snapshots());
    return await FirebaseFirestore.instance.collection(collectionName).snapshots();
  }

}