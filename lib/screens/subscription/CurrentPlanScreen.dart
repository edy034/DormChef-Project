import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dormchef/provider.dart';

class CurrentPlanScreen extends StatefulWidget {
  const CurrentPlanScreen({Key? key}) : super(key: key);

  @override
  _CurrentPlanScreenState createState() => _CurrentPlanScreenState();
}

class _CurrentPlanScreenState extends State<CurrentPlanScreen> {
  String uid = '';

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context as BuildContext, listen: false);
    uid = userProvider.uid.toString();
    fetchUserData(uid);
  }

  Future<void> fetchUserData(String uid) async {
    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      print(userDoc.id);
      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data()!;
        // Process the userData as needed
      } else {
        // User document does not exist
        print('User not found');
      }
    } catch (error) {
      // Handle any errors that occur during data fetching
      print('Error fetching user data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Current Plan',
          style: GoogleFonts.manrope(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B9A61),
          ),
        ),
      ),
      body: Center(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(uid) // Replace 'uid' with the actual user ID
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!.data() as Map<String, dynamic>?;
              if (data != null) {
                final subscriptionPlan =
                    data['subscription'] as String? ?? 'DormChef Free Plan';

                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Your Plan:\n$subscriptionPlan',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B9A61),
                      ),
                    ),
                  ),
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
