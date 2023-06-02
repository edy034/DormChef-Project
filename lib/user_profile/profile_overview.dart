import 'package:flutter/material.dart';
import 'package:dormchef/text_style.dart';

class ProfileOverview extends StatefulWidget {
  const ProfileOverview({Key? key}) : super(key: key);

  static const String routeName = '/profile_overview';

  @override
  State<ProfileOverview> createState() => _ProfileOverviewState();
}

/*This class shown profile overview including number of user's following, follower and recipe.
  This class also provide user with "Edit Profile" and "My Recipe" button to navigate user to
  edit profile page and my recipe page respectively.*/

class _ProfileOverviewState extends State<ProfileOverview> {
  @override
  Widget build(BuildContext context) {

    // This is the main widget for this class
    return Align(
        alignment: Alignment.center,
        child: Column(
          children: [

            // This is the widget for the number of user's following
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // This is the widget for the number of user's following
                Column(
                  children: [
                    Text(
                      '100',
                      style: ManropeTextStyles.textStyle(fontSize: 16, fontWeight: FontWeight.w600,),
                    ),
                    Text(
                      'following',
                      style: ManropeTextStyles.textStyle(color: const Color(0xFF585858)),
                    )
                  ],
                ),

                const SizedBox(width: 46),

                // This is the widget for the number of user's follower
                Column(
                  children: [
                    Text(
                      '452',
                      style: ManropeTextStyles.textStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'follower',
                      style: ManropeTextStyles.textStyle(
                          color: const Color(0xFF585858)),
                    )
                  ],
                ),

                const SizedBox(width: 46),

                // This is the widget for the number of user's recipe
                Column(
                  children: [
                    Text(
                      '1',
                      style: ManropeTextStyles.textStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'recipe',
                      style: ManropeTextStyles.textStyle(
                          color: const Color(0xFF585858)),
                    )
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16.0),

            // This is the widget for the "Edit Profile" and "My Recipe" button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // This is the widget for the "Edit Profile" button
                Container(
                    height: 48.0,
                    width: 182.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(
                        width: 1.2,
                        color: const Color(0xFF999999),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Edit Profile',
                        style: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
                      ),
                    )),

                const SizedBox(width: 16),

                // This is the widget for the "My Recipe" button
                Container(
                    height: 48.0,
                    width: 182.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: const Color(0xFF0B9A61),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'My Recipe',
                        style: ManropeTextStyles.textStyle(color: const Color(0xFFFFFFFF)),),
                    )),
              ],
            ),
          ],
        ));
  }
}
