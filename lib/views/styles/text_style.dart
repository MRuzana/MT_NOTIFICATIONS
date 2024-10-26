import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle({
  required double fontSize,
  required Color color,
  required fontWeight,
  double? lineHeight,
}) {
  return GoogleFonts.quicksand(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: lineHeight
  );
}

TextStyle custom1TextStyle({
  required double fontSize,
  required Color color,
  required fontWeight,
  double? lineHeight,
}) {
  return GoogleFonts.roboto(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: lineHeight
  );
}