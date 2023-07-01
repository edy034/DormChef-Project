import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/services/provider.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<String?> fetchUserData(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final String uid = userProvider.uid.toString();
    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        // Map to user object
        Map<String, dynamic> userData = userDoc.data()!;
        return jsonEncode(userData);
      }
    } catch (error) {
      // ignore: avoid_print
      return 'Error fetching user data: $error';
    }
    return null;
  }

  static Future<String?> updateUserData(BuildContext context, String firstname, String lastname, String phone, String username) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final String uid = userProvider.uid.toString();
    try {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      await userDoc.update({
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'username': username,
      });
      return 'User data updated successfully';
    } catch (error) {
      return 'Error updating user data: $error';
    }
  }

  Future<void> updateProfilePicture(String uid, String profilePicture) async {
    try {
      final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      await userDoc.update({
        'profilePicture': profilePicture,
      });
      // ignore: avoid_print
      print('Profile picture updated successfully');
    } catch (error) {
      // ignore: avoid_print
      print('Error updating profile picture: $error');
    }
  }
}