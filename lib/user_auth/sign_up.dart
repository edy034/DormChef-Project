import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/user_auth/sign_in.dart';
import 'package:dormchef/navigation.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routeName = '/sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Title
          Positioned(
              left: 140.0,
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
                          obscureText: !_isPasswordVisible,
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Iconsax.eye
                                      : Iconsax.eye_slash,
                                  color: Color(0xFF444444),
                                ),
                              )),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )),

                // Terms and Conditions
                SizedBox(height: 20),
                Positioned(
                  left: 44.0,
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'By signing up, you\'re agree to our ',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000),
                              ),
                            ),
                            TextSpan(
                              text: 'Terms and Conditions\n',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF0B9A61),
                              ),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000),
                              ),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF0B9A61),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 48),

                // Continue Button
                Positioned(
                  left: 24.0,
                  child: Column(children: [
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Navigation()))
                      },
                      child: Container(
                          width: 364.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Color(0xFF0B9A61),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Continue',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF),
                                  )))),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Join us before?",
                          style: GoogleFonts.manrope(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111111),
                          ),
                        ),
                        SizedBox(width: 4),
                        GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignIn()))
                                },
                            child: Text('Login',
                                style: GoogleFonts.manrope(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF0B9A61),
                                ))),
                      ],
                    )
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
