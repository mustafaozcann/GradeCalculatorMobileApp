import 'package:flutter/material.dart';
import 'package:grade_calculator_app/models/lesson.dart';

class DataHelper {

  

  static List<String> allLessonGrade() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }


  static List<Lesson> allAddedLesson =[];

  static addLesson(Lesson lesson){
    allAddedLesson.add(lesson);
  }

  static double gradeCalculate(){

    double totalGrade = 0;
    double totalCredit = 0;

    allAddedLesson.forEach((element) {
      totalGrade = totalGrade + (element.creditPoint * element.letterPoint);
      totalCredit += element.creditPoint;
    });

    return totalGrade / totalCredit;


  }

  static double letterConvertGrade(String letter) {
    switch (letter) {
      case "AA":
        return 4;

      case "BA":
        return 3.5;

      case "BB":
        return 3.0;

      case "CB":
        return 2.5;

      case "CC":
        return 2.0;

      case "DC":
        return 1.5;

      case "DD":
        return 1.0;

      case "FD":
        return 0.5;

      case "FF":
        return 0.0;

      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonLetterDropdown() {
    return allLessonGrade()
        .map((letter) => DropdownMenuItem(
              child: Text(letter as String),
              value: letterConvertGrade(letter as String),
            ))
        .toList();
  }

  static List<int> allLessonCredit() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allCreditDropdown() {
    return allLessonCredit()
        .map((credit) => DropdownMenuItem<double>(
              child: Text(credit.toString()),
              value: credit.toDouble(),
            ))
        .toList();
  }
}
