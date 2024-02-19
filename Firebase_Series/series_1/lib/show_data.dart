import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Show Data"),
      centerTitle: true,),

      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.active){
          if(snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
              return ListTile(
                trailing: Icon(Icons.ice_skating),

                leading: CircleAvatar(
                  child: Text("${index+1}"),
                ),
                title: snapshot.data!.docs[index]["title"] != ""
                  ? Text(snapshot.data!.docs[index]["title"])
                  : const Text("Title") ,
                subtitle: snapshot.data!.docs[index]["description"] != ""
                    ?Text(snapshot.data!.docs[index]["description"])
                    : const Text("Description") ,
              );
            });


          }else if(snapshot.hasError){
            return Center(child:
              Text(snapshot.error.toString()),);
          }else{
            return Center(child: Text("No Data Found"),);
          }
        }else{
          return CircularProgressIndicator();
        }
        },),


    );
  }
}
