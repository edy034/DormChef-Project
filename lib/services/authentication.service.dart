import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<String?> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Sign in successful';
    } catch (e) {
      return 'Sign in failed. Please check your credentials';
    }
  }

  static Future<UserCredential> signUp(String email, String password) async {
    return await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }

  static Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  static Future<void> sendPasswordResetEmail(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}