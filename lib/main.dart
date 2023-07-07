import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/pages/Screen_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFC58AA6),
        scaffoldBackgroundColor: Color(0xFFC58AA6),
      ),
      home: Screen_1(),
    );
  }
}
