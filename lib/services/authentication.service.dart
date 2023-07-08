import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dormchef/models/users.dart';
import 'package:dormchef/services/provider.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<String?> signIn(String email, String password, BuildContext context) async {
    try {
      final UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      if (user != null) {
        // ignore: use_build_context_synchronously
        UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUID(user.uid);
      }
      return 'Sign in successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email provided';
      }
      rethrow;
    } catch (e) {
      return e.toString();
    }
  }
  
  static Future<String?> signUp(String email, String password, String username,
      String firstname, String lastName) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = auth.currentUser;
      if (firebaseUser != null) {
        Users user = Users.withName(firebaseUser.uid, username, firstname, lastName,
            email, 'This person is lazy to set a bio', '', 'profile.jpg', 'Free Plan');
        Map<String, dynamic> userMap = user.toMap();
        await firestore.collection('users').doc(firebaseUser.uid).set(userMap);
      }
      return 'Sign up successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      }
      rethrow;
    } catch (e) {
      return 'Sign up failed. Please check your credentials';
    }
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