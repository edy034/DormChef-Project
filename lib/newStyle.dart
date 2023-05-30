import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  static TextStyle textStyle({double fontSize = 20, FontWeight fontWeight = FontWeight.w500, Color color = const Color(0xFF444444),}) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
