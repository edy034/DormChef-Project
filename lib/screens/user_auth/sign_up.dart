import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/screens/user_auth/sign_in.dart';
import 'package:dormchef/screens/user_homepage/navigation.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:dormchef/controllers/user_auth/auth_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routeName = '/sign_up';

  @override
  State<SignUp> createState() => _SignUpState();
}

/*This class is mainly for register user into the system.*/

class _SignUpState extends State<SignUp> {
  // Create an instance of AuthController
  AuthController authController = AuthController();

  // Create TextEditingController for email, password and username
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  // Bool for password visibility
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Title
          Positioned(
            left: 140.0,
            top: 136.0,
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
                  style: ManropeTextStyles.textStyle(
                      color: const Color(0xFF111111)),
                ),
              ],
            ),
          ),

          // Email Address
          Positioned(
            left: 24.0,
            top: 290.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Email Address',
                style:
                    ManropeTextStyles.textStyle(color: const Color(0xFF111111)),
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
                        controller: emailController,
                        style: ManropeTextStyles.textStyle(
                            color: const Color(0xFF444444)),

                        // Hint Text
                        decoration: InputDecoration(
                          hintText: 'hafiz@ocean.umt.edu',
                          hintStyle: ManropeTextStyles.textStyle(
                              color: const Color(0xFF444444)),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ))
            ]),
          ),

          // Password
          Positioned(
            left: 24.0,
            top: 386.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: ManropeTextStyles.textStyle(
                      color: const Color(0xFF111111)),
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
                          controller: passwordController,
                          obscureText: !_isPasswordVisible,
                          style: ManropeTextStyles.textStyle(
                              color: const Color(0xFF444444)),

                          // Hint Text
                          decoration: InputDecoration(
                              hintStyle: ManropeTextStyles.textStyle(
                                  color: const Color(0xFF444444)),
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
              ],
            ),
          ),

          // Username
          Positioned(
            left: 24.0,
            top: 482.0,
            child: SizedBox(
              width: 364.0, // Add a specific width constraint
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: ManropeTextStyles.textStyle(
                        color: const Color(0xFF111111)),
                  ),
                  const SizedBox(height: 12),
                  Container(
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
                        child: Row(
                          children: [
                            Text(
                              '@',
                              style: ManropeTextStyles.textStyle(
                                  color: const Color(0xFF444444)),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: usernameController,
                                style: ManropeTextStyles.textStyle(
                                    color: const Color(0xFF444444)),
                                decoration: InputDecoration(
                                  hintText: 'username',
                                  hintStyle: ManropeTextStyles.textStyle(
                                      color: const Color(0xFF444444)),
                                  border: InputBorder.none,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Terms and Conditions
          Positioned(
            left: 44.0,
            top: 886.0,
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
                        style: ManropeTextStyles.textStyle(
                            color: const Color(0xFF0B9A61)),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: ManropeTextStyles.textStyle(),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: ManropeTextStyles.textStyle(
                            color: const Color(0xFF0B9A61)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // Continue Button
          Positioned(
            left: 24.0,
            top: 754.0,
            child: Column(children: [
              GestureDetector(
                onTap: () => {
                  // Assign the value of the email, password and username to the user object
                  authController.registerUser(
                      emailController.text, passwordController.text, usernameController.text),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Navigation()))
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
                          style: ManropeTextStyles.textStyle(
                              color: const Color(0xFF0B9A61)))),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
