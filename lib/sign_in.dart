import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Title
          Positioned(
              left: 153.0,
              top: 156.0,
              child: Column(
                children: [
                  Text(
                    'DormChef',
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B9A61),
                    ),
                  ),
                  SizedBox(height: 8), //spacing between text and subtext
                  Text(
                    'Recipe without limits',
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF111111),
                    ),
                  ),
                ],
              )),

          //Email Address
          Positioned(
            left: 24.0,
            top: 310.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email Address',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111111),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                    width: 364.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        width: 1.2,
                        color: Color(0xFF999999),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          style: GoogleFonts.manrope(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF444444),
                          ),
                          decoration: InputDecoration(
                            hintText: 'hafiz@ocean.umt.edu',
                            hintStyle: GoogleFonts.manrope(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF444444),
                            ),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )),
              ],
            ),
          ),

          //Password
          Positioned(
            left: 24.0,
            top: 406.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF111111),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                    width: 364.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        width: 1.2,
                        color: Color(0xFF999999),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          obscureText: true,
                          style: GoogleFonts.manrope(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF444444),
                          ),
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.manrope(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF444444),
                            ),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )),
              ],
            ),
          )

          

          
        ],
      ),
    );
  }
}
