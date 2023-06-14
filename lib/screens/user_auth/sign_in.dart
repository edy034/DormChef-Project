import 'package:flutter/material.dart';
import 'package:dormchef/screens/user_auth/sign_up.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:dormchef/controllers/user_auth/auth_controller.dart';
import 'package:dormchef/screens/input_text.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String routeName = '/sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

/*This class is mainly for authentication user into the system.*/

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Project Title
          Positioned(
              left: 140.0,
              top: 156.0,
              child: Column(
                children: [
                  Text(
                    'DormChef',
                    style: ManropeTextStyles.textStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
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
              )),

          //Email Address
          Positioned(
            left: 24.0,
            top: 310.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFieldContainer(
                  textLabel: 'Email Address',
                  controller: emailController,
                  hintText: 'hafiz@graduate.utm.my',
                ),
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
                CustomPasswordTextFieldContainer(
                  textLabel: 'Password',
                  controller: passwordController,
                  hintText: 'Enter your password',
                ),
              ],
            ),
          ),

          // Sign In Button
          Positioned(
            left: 24.0,
            top: 516.0,
            child: Column(children: [
              GestureDetector(

                onTap: () {
                  AuthController().signIn(
                      context, emailController.text, passwordController.text);
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
                        child: Text('Login',
                            style: ManropeTextStyles.textStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFFFFFF))))),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: ManropeTextStyles.textStyle(
                        color: const Color(0xFF111111)),
                  ),

                  const SizedBox(width: 4),

                  // Sign Up
                  GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()))
                          },
                      child: Text('Sign Up',
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
