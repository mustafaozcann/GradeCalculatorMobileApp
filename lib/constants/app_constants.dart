import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor mainColor = Colors.indigo;
  static const MaterialColor harmoniColor = Colors.amber;

  static const String titleText = "Ortalama Hesapla";

  static final EdgeInsetsGeometry horizontalPadding =
      EdgeInsets.symmetric(horizontal: 8);

  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);

  static final TextStyle showGradeBody = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);

  static final TextStyle gradeAverageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);

  static final BorderRadius borderRadius = BorderRadius.circular(16);

  static final EdgeInsetsGeometry dropdownPadding =
      EdgeInsets.symmetric(vertical: 8, horizontal: 16);
}
