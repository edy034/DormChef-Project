import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/* List of Font Weight codes: */
// 100 Thin
// 200 Extra Light
// 300 Light
// 400 Regular
// 500 Medium
// 600 Semi Bold
// 700 Bold
// 800 Extra Bold
// 900 Black

class ManropeTextStyles {
  static TextStyle textStyle({double fontSize = 13, FontWeight fontWeight = FontWeight.w500, Color color = const Color(0xFF000000),}) {
    return GoogleFonts.manrope(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}

class PoppinsTextStyles {
  static TextStyle textStyle({double fontSize = 13, FontWeight fontWeight = FontWeight.w500, Color color = const Color(0xFF000000),}) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
