import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/screens/subscription/CurrentPlanScreen.dart';
import 'package:dormchef/screens/subscription/subForm.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text_style.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

  void updateSubscriptionPlan(String userId, String subscriptionPlan) {
    // Update the subscription plan for the user in the database
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      'subscriptionPlan': subscriptionPlan,
    }).then((value) {
      print('Subscription plan updated successfully');
    }).catchError((error) {
      print('Failed to update subscription plan: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonSelected = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose a plan",
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B9A61),
                    ),
                  ),
                  Text(
                    "Select the offer that best suits your needs",
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc('userId')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!.data() as Map<String,
                            dynamic>?;

                        if (data != null) {
                          final subscriptionPlan = data['subscriptionPlan']
                                  as String? ??
                              'DormChef Free Plan';

                          return Text(
                            "\n\nYour active plan: $subscriptionPlan",
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0B9A61),
                            ),
                          );
                        }
                      }

                      return SizedBox();
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton(
                onPressed: () {
                  updateSubscriptionPlan('userId', 'Dorm Chef Free Plan');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CurrentPlanScreen(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 32, top: 20, right: 0, bottom: 0)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 45)),
                        Image.network(
                          'https://picsum.photos/150',
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DormChef Free Plan",
                              style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Get access to basic features",
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 25),
                        const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Learn more',
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton(
                onPressed: () {
                  updateSubscriptionPlan('userId', 'Dorm Chef Premium Plan');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CurrentPlanScreen(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 32, top: 20, right: 0, bottom: 0)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 45)),
                        Image.network(
                          'https://picsum.photos/150',
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DormChef Premium Plan",
                              style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Get access to all features",
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 25),
                        const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Learn more',
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => SubForm(),
                );
              },
              child: Text(
                "Contact Us",
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF0B9A61)),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

