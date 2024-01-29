import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle myTestStyle1({  Color textColor = Colors.red,   FontWeight textWeight = FontWeight.w600, double size = 25   }){
  return TextStyle(

    fontSize: size,
    color: textColor,
    fontWeight: textWeight,



  );
}