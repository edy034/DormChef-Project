import 'package:flutter/material.dart';
import 'package:dormchef/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dormchef/splash_screen.dart';
import 'package:dormchef/sign_in.dart';
import 'package:dormchef/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DormChef';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: const SplashScreen(), 
    routes: {
      SplashScreen.routeName: (context) => const SplashScreen(),
      SignIn.routeName: (context) => const SignIn(),
      HomePage.routeName: (context) => const HomePage(),
    });
  }
}
