import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grade_calculator_app/constants/app_constants.dart';
import 'package:grade_calculator_app/screens/homepage.dart';

void main(List<String> args) {
  
  runApp(GradeCalculatorApp());

}


class GradeCalculatorApp extends StatelessWidget {
  const GradeCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Constants.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,


      ),
      home: HomePage(),

    );
  }
}