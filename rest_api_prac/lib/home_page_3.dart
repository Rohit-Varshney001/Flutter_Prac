import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_api_prac/home_page_4.dart';
import 'Model/UsersModel.dart';
import 'package:http/http.dart' as http;

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  List<UsersModel> usersList = [];
  Future<List<UsersModel>> getUsers() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      usersList.clear();
      for (Map i in data) {
        usersList.add(UsersModel.fromJson(i));
      }
      return usersList;
    } else {
      return usersList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage4()));},
            child: const Icon(Icons.navigate_next)),
        title: const Text("Home Page"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUsers(),
            builder: (context, AsyncSnapshot<List<UsersModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              reusableRow(
                                  title: 'Name:',
                                  value: snapshot.data![index].name.toString()),
                              reusableRow(
                                  title: 'User name:',
                                  value: snapshot.data![index].username
                                      .toString()),
                              reusableRow(
                                  title: 'Email:',
                                  value:
                                      snapshot.data![index].email.toString()),
                              reusableRow(
                                  title: 'Address:',
                                  value:
                                      "${snapshot.data![index].address!.street}, ${snapshot.data![index].address!.city}"),
                              reusableRow(
                                  title: ' ',
                                  value:
                                      "${snapshot.data![index].address!.geo!.lat}, ${snapshot.data![index].address!.geo!.lng}"),
                            ],
                          ),
                        ),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}

class reusableRow extends StatelessWidget {
  String title, value;
  reusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
