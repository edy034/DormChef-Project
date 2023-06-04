import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/screens/user_auth/sign_up.dart';
import 'package:dormchef/screens/user_homepage/navigation.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:dormchef/controllers/user_auth/auth_controller.dart';

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
  bool _isPasswordVisible = false;

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

                // Textfield for email address
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
                        child: TextField(
                          controller: emailController,
                          style: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),

                          // Hint text
                          decoration: InputDecoration(
                            hintText: 'hafiz@graduate.utm.my',
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
                  style: ManropeTextStyles.textStyle(color: const Color(0xFF111111)),
                ),

                const SizedBox(height: 12),
                
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

                    // Textfield for password
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),

                        // Password textfield
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: !_isPasswordVisible,
                          style: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
                          decoration: InputDecoration(
                              hintStyle: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
                              border: InputBorder.none,

                              // Password visibility icon
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

          // Sign In Button
          Positioned(
            left: 24.0,
            top: 516.0,
            child: Column(children: [
              GestureDetector(
                onTap: () => {
                  AuthController().signInUser(emailController.text, passwordController.text),
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
                    style: ManropeTextStyles.textStyle(color: const Color(0xFF111111)),
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
                          style: ManropeTextStyles.textStyle(color: const Color(0xFF0B9A61)))),
                ],
              )
            ]),
          ),

          // Sign In with Google
          Positioned(
            top: 710.0,
            left: 202.0,
            child: Center(
                child: Text(
              'or',
              style: ManropeTextStyles.textStyle(color: const Color(0xFF444444),)
            )),
          ),

          Positioned(
            top: 746.0,
            left: 24.0,
            child: Column(
              children: [
                Container(
                  width: 364.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      width: 1.2,
                      color: const Color(0xFF000000),
                    ),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Sign in with Google',
                          style: ManropeTextStyles.textStyle(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF000000)))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
