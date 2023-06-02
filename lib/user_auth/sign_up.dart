import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/user_auth/sign_in.dart';
import 'package:dormchef/navigation.dart';
import 'package:dormchef/text_style.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routeName = '/sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

/*This class is mainly for register user into the system.*/

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
                    style: ManropeTextStyles.textStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0B9A61),
                    ),
                  ),

                  const SizedBox(height: 8), //spacing between text and subtext
                  Text(
                    'Recipe without limits',
                    style: ManropeTextStyles.textStyle(color: const Color(0xFF111111)),
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
                  style: ManropeTextStyles.textStyle(color: const Color(0xFF111111)),
                ),

                const SizedBox(height: 12),

                // Email Address TextField
                Container(
                    width: 364.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        width: 1.2,
                        color: const Color(0xFF999999),
                      ),
                    ),

                    // Email Address TextField
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextField(
                          style: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),

                          // Hint Text
                          decoration: InputDecoration(
                            hintText: 'hafiz@ocean.umt.edu',
                            hintStyle: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
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
                    color: const Color(0xFF111111),
                  ),
                ),

                const SizedBox(height: 12),

                // Password TextField
                Container(
                    width: 364.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        width: 1.2,
                        color: const Color(0xFF999999),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: TextFormField(
                          obscureText: !_isPasswordVisible,
                          style: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),

                          // Hint Text
                          decoration: InputDecoration(
                              hintStyle: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },

                                // Password Visibility Icon
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Iconsax.eye
                                      : Iconsax.eye_slash,
                                  color: const Color(0xFF444444),
                                ),
                              )),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )),

                // Terms and Conditions
                const SizedBox(height: 20),

                Positioned(
                  left: 44.0,
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'By signing up, you\'re agree to our ',
                              style: ManropeTextStyles.textStyle(),
                            ),

                            // Terms and Conditions
                            TextSpan(
                              text: 'Terms and Conditions\n',
                              style: ManropeTextStyles.textStyle(color: const Color(0xFF0B9A61)),
                            ),
                            TextSpan(
                              text: 'and ',
                              style: ManropeTextStyles.textStyle(),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: ManropeTextStyles.textStyle(color: const Color(0xFF0B9A61)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 48),

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
                            color: const Color(0xFF0B9A61),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Continue',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF),
                                  )))),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Join us before?",
                          style: ManropeTextStyles.textStyle(),
                        ),

                        const SizedBox(width: 4),

                        GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SignIn()))
                                },
                            child: Text('Login',
                                style: ManropeTextStyles.textStyle(color: const Color(0xFF0B9A61)))),
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
