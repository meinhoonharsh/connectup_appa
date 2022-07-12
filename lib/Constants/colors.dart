// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class MyColors {
  static const Color primaryColor = Color(0xff0A192F);
}

LinearGradient linearGradient() {
  return LinearGradient(
    colors: const [
      Color(0xff233554),
      Color(0xff0A192F),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: const [0, 1],
  );
}
