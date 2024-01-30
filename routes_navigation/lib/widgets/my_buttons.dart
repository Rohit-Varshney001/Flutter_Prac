import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  // const MyButton({super.key});
  final String buttonText;
  final String routeName;
  final VoidCallback onPressed;
  final bool flag;

  MyButton({
    Key? key,
    required this.buttonText,
    required this.routeName,
    required this.onPressed,
    required this.flag,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool changedButton = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!widget.flag) {
          // If flag is false, do not navigate
          print("Flag is false, button not clicked!");
          return;
        }
        setState(() {
          changedButton = true;
        });
        await Future.delayed(Duration(seconds: 1));
        widget.onPressed(); // Execute the provided callback
        Navigator.pushNamed(context, widget.routeName);
      },
      child: AnimatedContainer(
        height: 45,
        width: changedButton ? 80 : 120,
        child: Center(
          child: changedButton
              ? Icon(Icons.done, color: Colors.white,)
              : Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(changedButton ? 50 : 10),
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
