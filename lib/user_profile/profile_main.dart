import 'package:flutter/material.dart';
import 'package:dormchef/user_profile/user_identity.dart';
import 'package:dormchef/user_profile/profile_overview.dart';
import 'package:dormchef/user_profile/user_plan.dart';
import 'package:dormchef/user_profile/report_issue.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);

  static const String routeName = '/profile_main';

  @override
  State<ProfileMain> createState() => _ProfileMainState();

  static double getWidgetWidth(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerWidth = screenWidth - 37.0 - 16.0 - 34.0;
    return containerWidth;
  }
}

/*This is the main class for user profile.*/

class _ProfileMainState extends State<ProfileMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[

            // Add padding to the top of the screen
            Padding(
              padding: EdgeInsets.only(top: 48.0),
              // This is the widget for the user's identity
              child: UserIdentity(),
            ),

            SizedBox(height: 16.0),

            // This is the widget for the user's profile overview
            ProfileOverview(),

            SizedBox(height: 12),

            // Divider with thickness 1.2 and color grey
            Divider(thickness: 1.2, color: Color(0xFF999999),),

            SizedBox(height: 18),

            // Add padding to the left of the screen
            Padding(
              padding: EdgeInsets.only(left: 24.0),
              // This is the widget for the user's plan
              child: UserPlan(),
            ),

            SizedBox(height: 28),

            // This is the widget for the report issue button
            ReportIssue()

          ],
        ),
      ),
    );
  }
}
