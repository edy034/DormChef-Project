import 'package:flutter/material.dart';
import 'package:dormchef/database/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dormchef/screens/user_auth/splash_screen.dart';
import 'package:dormchef/screens/user_auth/sign_in.dart';
import 'package:dormchef/screens/user_homepage/navigation.dart';
import 'package:dormchef/screens/user_profile/profile_edit/profile_edit.dart';
import 'package:provider/provider.dart';
import 'package:dormchef/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: const MyApp(),
    ),);
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
      Navigation.routeName: (context) => const Navigation(),
      ProfilePage.routeName: (context) => const ProfilePage(),
    });
  }
}
