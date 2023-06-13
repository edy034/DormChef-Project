import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../screens/user_homepage/navigation.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(
      String email, String password, String username) async {
    // Create a new user object
    Users user = Users();

    // Set the user's email, password and username
    user.setEmail(email);
    user.setPassword(password);
    user.setUsername(username);

    // Create a new user in Firebase Authentication
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = _auth.currentUser;

      if (firebaseUser != null) {
        // get the user id
        user.setUid(firebaseUser.uid);

        // Convert user object to map
        Map<String, dynamic> userMap = user.toMap();

        // Reference to the user's document in Firestore
        await _firestore.collection('users').doc(firebaseUser.uid).set(userMap);
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error in creating user: $error");
      }
    }
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        email.contains('@') &&
        email.contains('.')) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Navigation()));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password'),
          ),
        );
      }
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password'),
        ),
      );
    }
  }
}
