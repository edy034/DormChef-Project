import 'package:flutter/material.dart';
import 'package:dormchef/splash_screen.dart';
import 'package:dormchef/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DormChef';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const SplashScreen(),
      
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        SignIn.routeName: (context) => const SignIn(),
      }
    );
  }
}
