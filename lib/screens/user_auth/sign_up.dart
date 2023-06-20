import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dormchef/screens/user_auth/sign_in.dart';
import 'package:dormchef/screens/user_homepage/navigation.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:dormchef/controllers/user_auth/auth_controller.dart';
import 'package:dormchef/screens/input_text.dart';

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
  TextEditingController fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 156.0),
          child: Text(
            'DormChef',
            style: ManropeTextStyles.textStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0B9A61),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Recipe without limits',
            style: ManropeTextStyles.textStyle(color: const Color(0xFF111111)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: CustomTextFieldContainer(
            textLabel: 'Email Address',
            controller: emailController,
            hintText: 'hafiz@graduate.utm.my',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: CustomPasswordTextFieldContainer(
            textLabel: 'Password',
            controller: passwordController,
            hintText: 'Enter your password',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
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
                                    color: const Color(0xFF111111)),
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
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: CustomTextFieldContainer(
            textLabel: 'Full Name',
            controller: usernameController,
            hintText: 'Hafiz Ahmad bin Fauzi',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
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
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(children: [
            GestureDetector(
              onTap: () => {
                // Assign the value of the email, password and username to the user object
                authController.registerUser(emailController.text,
                    passwordController.text, usernameController.text, fullnameController.text),
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
                        style: ManropeTextStyles.textStyle(
                            color: const Color(0xFF0B9A61)))),
              ],
            )
          ]),
        )
      ]),
    ));
  }
}
