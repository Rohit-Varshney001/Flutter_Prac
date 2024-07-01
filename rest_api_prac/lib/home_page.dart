import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_prac/home_page_2.dart';

import 'Model/PostsModel.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage2()));
            },
            child: const Icon(Icons.navigate_next_outlined)),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("Loading..."),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Title: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(postList[index].title.toString()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Description: : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Text(postList[index].body.toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
