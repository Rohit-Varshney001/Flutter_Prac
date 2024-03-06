import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:todo_app/database%20helper/check_user.dart';
import 'package:todo_app/login_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

              title:Text(nameChk == null?
                "Hii, $nameLogin":"Hii, $nameChk"
                ,style: TextStyle(
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
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisExtent: 210,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: arrColours[index],
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      // child: Text(
                      //   quotesList[index]["quote"],
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 20,
                      //   ),
                      // ),
                    ),
                  );
                },
                childCount: arrColours.length,
              ),
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

