import 'package:flutter/material.dart';
import 'package:routes_navigation/pages/homePage.dart';
import 'package:routes_navigation/widgets/my_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromRGBO(242, 242, 223, 1.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(image: AssetImage("assets/images/login_image.png"), fit: BoxFit.cover, height: 300,width: 300,),
              SizedBox(height: 15,),
              Text("Hii, $name", style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: TextFormField(
                  onChanged: (value){
                    name = value;
                    build(context);
                    setState(() {

                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    labelText: "UserName",
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
              ),
              SizedBox(height: 25,),

              // Created Button on custom Widget
              // InkWell(
              //   onTap: () async{
              //     setState(() {
              //       changedButton = true;
              //     });
              //     await Future.delayed(Duration(seconds: 1));
              //     Navigator.pushNamed(context, "/homepage");
              //   },
              //   child: AnimatedContainer(
              //     height: 45,
              //     width: changedButton ? 80: 120,
              //     // color: Colors.purple,
              //     child: Center(child:
              //     changedButton? Icon(Icons.done, color: Colors.white,) : Text("Click!", textAlign: TextAlign.center,style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 25
              //     ),
              //     )),
              //     decoration: BoxDecoration(
              //       color: Colors.deepPurple,
              //       borderRadius: BorderRadius.circular(changedButton? 50 :10),
              //     ), duration: Duration(seconds: 1),
              //   ),
              // ),
              MyButton(buttonText: "Login", routeName: "/homepage",flag: false, onPressed: () {
                // Add your custom logic here
                print("Button Clicked!");
              },)

          ],


                ),
        )
    );
  }
}
