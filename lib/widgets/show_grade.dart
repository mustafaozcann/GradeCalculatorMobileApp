import 'package:flutter/widgets.dart';
import 'package:grade_calculator_app/constants/app_constants.dart';

class ShowGrade extends StatelessWidget {
  final double gradeAverage;
  final int lessonCount;



  const ShowGrade({required this.gradeAverage, required this.lessonCount,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text(
          lessonCount > 0 ? "$lessonCount Ders Girildi" : "Ders Seçiniz",
          style: Constants.showGradeBody,
        ),
        Text(gradeAverage >= 0 ? "${gradeAverage.toStringAsFixed(2)}" : "0.0" 
          , style: Constants.gradeAverageStyle,),
        Text("Ortalama", style: Constants.showGradeBody,),



      ],
    );
  }
}