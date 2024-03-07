import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:todo_app/database%20helper/check_user.dart';
import 'package:todo_app/inside_grid.dart';
import 'package:todo_app/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'database helper/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Stream? collectionData;
  var nameChk = username;
  var nameLogin = name;
  List quotesList = [
    {"id": 1, "quote": "\"Success is not final, Failure is not fatal; it is the courage to continue that counts\""},
    {"id": 2, "quote": "\"If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success.\""},
    {"id": 3, "quote": "\"Darkness cannot drive out darkness: only light can do that. Hate cannot drive out hate: only love can do that.\""},
  ];
  CarouselController carouselController = CarouselController();
  int current_index = 0;

  var arrColours = [Colors.orangeAccent, Colors.yellow,Colors.green,Colors.grey,Colors.orangeAccent, Colors.yellow,Colors.green,Colors.grey,Colors.black,Colors.red, Colors.yellow,Colors.green,Colors.grey,Colors.black ];



  Widget buildDocumentText(BuildContext context, int index, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    final List<DocumentSnapshot> documents = snapshot.data!.docs;
    final String documentName = documents[index].id;
    return Text(
      documentName,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 50,
            pinned: true,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.deepPurpleAccent,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(

              title:Text(
                "Hii, &User",
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),),
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [

                      Text("Hii, &user", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      )),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: ClipOval(
                          child:  Image.asset("assets/images/profile_logo.png"),
                          clipBehavior: Clip.hardEdge,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: Colors.deepPurpleAccent,
                      child: Stack(

                        children: [



                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2), // Set the color and opacity of circles
                              ),
                              margin: EdgeInsets.only(
                                left: 0, // Adjust the left margin of circles
                                top: 80, // Adjust the top margin of circles
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2), // Set the color and opacity of circles
                              ),
                              margin: EdgeInsets.only(
                                left: 180, // Adjust the left margin of circles
                                top: 20, // Adjust the top margin of circles
                              ),
                            ),
                          ),

                          CarouselSlider(items: quotesList.map((item) => Padding(
                            padding: const EdgeInsets.only(top: 25.0,left: 10),
                            child: Text(
                              item["quote"],style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),
                            ),
                          )).toList(),
                              options: CarouselOptions(
                                  scrollPhysics: BouncingScrollPhysics(),
                                  autoPlay: true,
                                  aspectRatio: 1.5,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      current_index = index;
                                    });
                                  })),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: quotesList.asMap().entries.map((entry) {

                                  return GestureDetector(
                                    onTap: () =>
                                        carouselController.animateToPage(entry.key),
                                    child: Container(
                                      width: current_index == entry.key ? 17 : 7,
                                      height: 7.0,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 3.0,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: current_index == entry.key
                                              ? Colors.deepPurple.shade200
                                              : Colors.purple.shade50),
                                    ),
                                  );
                                }).toList(),
                              ))


                        ],
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection(nameChk ?? nameLogin).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverToBoxAdapter(
                    child: Container(
                      width: 0,
                      height: 0,
                    )
                  );
                }
                if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  );
                }
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 210,
                    mainAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      final String documentName = documents[index].id;
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CompleteDocument(heading: documentName)));
                        },
                        child: Container(
                          color: arrColours[index % arrColours.length],
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              documentName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: documents.length,
                  ),
                );
              },
            ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}

