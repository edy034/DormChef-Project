import 'package:flutter/material.dart';
import 'package:dormchef/screens/user_auth/sign_up.dart';
import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:dormchef/controllers/user_auth/auth_controller.dart';
import 'package:dormchef/widgets/text_field.widget.dart';

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
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 156.0),
          child: Text(
            'DormChef',
              style: ManropeTextStyles.textStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
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
          padding: const EdgeInsetsDirectional.all(24),
          child: GestureDetector(
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
        ),
        Padding(
          padding: const EdgeInsetsDirectional.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style:
                    ManropeTextStyles.textStyle(color: const Color(0xFF111111)),

              ),
              const SizedBox(width: 4),
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
          ),
        ),
      ],
    )));
  }
}
