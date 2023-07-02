import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dormchef/services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dormchef/splash_screen.dart';
import 'package:dormchef/screens/user_auth/sign_in.dart';
import 'package:dormchef/screens/user_homepage/navigation.dart';
import 'package:dormchef/screens/user_profile/profile_edit.dart';
import 'package:provider/provider.dart';
import 'package:dormchef/services/provider.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
        create: (_) => UserProvider(), child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DormChef';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return const Navigation();
          } else {
            return const SignIn();
          }
        }),
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          SignIn.routeName: (context) => const SignIn(),
          Navigation.routeName: (context) => const Navigation(),
          ProfilePage.routeName: (context) => const ProfilePage(),
        });
  }
}
