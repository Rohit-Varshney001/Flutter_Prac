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


              MyButton(buttonText: "Login", routeName: "/homepage",flag: true, onPressed: () {
                // Add your custom logic here
                print("Button Clicked!!");
              },)

          ],
            
          ),
        )
    );
  }
}
