import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 153.0,
            top: 156.0,
            child: Text(
              'DormChef',
              style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0B9A61),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
