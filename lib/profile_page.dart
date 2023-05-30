import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/profilepage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Title
          Positioned(
            top: 54.0,
            left: 37.0,
            child: Row(
              children: [
                Container(
                  height: 48.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      width: 1.2,
                      color: Color(0xFF999999),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Hafiz Ahmad',
                      style: TextStyle1.textStyle1,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  height: 34.0,
                  width: 34.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Color(0xFF444444),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Iconsax.notification,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Profile Info
          Positioned(
            top: 120.0,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage('assets/hafiz.jpg'),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '@hafizahd',
                  style: TextStyle2.textStyle2,
                ),
                SizedBox(height: 8),
                Text(
                  'This person is lazy to set a bio',
                  style: TextStyle3.textStyle3,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '100',
                          style: TextStyle4.textStyle4,
                        ),
                        Text(
                          'following',
                          style: TextStyle2.textStyle2,
                        )
                      ],
                    ),
                    SizedBox(width: 46),
                    Column(
                      children: [
                        Text(
                          '452',
                          style: TextStyle4.textStyle4,
                        ),
                        Text(
                          'follower',
                          style: TextStyle2.textStyle2,
                        )
                      ],
                    ),
                    SizedBox(width: 46),
                    Column(
                      children: [
                        Text(
                          '1',
                          style: TextStyle4.textStyle4,
                        ),
                        Text(
                          'recipe',
                          style: TextStyle2.textStyle2,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                        height: 48.0,
                        width: 182.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            width: 1.2,
                            color: Color(0xFF999999),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Edit Profile',
                            style: TextStyle3.textStyle3,
                          ),
                        )),
                    SizedBox(width: 16),
                    Container(
                        height: 48.0,
                        width: 182.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Color(0xFF0B9A61),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'My Recipe',
                            style: TextStyle5.textStyle5,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Divider(
                    color: Color(0xFF999999),
                    thickness: 1.2,
                  ),
                )
              ],
            ),
          ),

          Positioned(
            top: 466.0,
            left: 24.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active Plan',
                  style: TextStyle6.textStyle6,
                ),
                SizedBox(height: 4),
                Text(
                  'Your currently is Dormchef Premium Plan\'s User',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  height: 208.0,
                  width: 364.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0297, 0.9688],
                      colors: [
                        Color(0xFF88FFC9).withOpacity(1.0),
                        Color(0xFFFFEC42).withOpacity(0.0)
                      ],
                      transform: GradientRotation(10.21 *
                          (3.1415926535897932 /
                              180)), // Convert degrees to radians
                    ),
                    border: Border.all(
                      width: 1.2,
                      color: Color(0xFF1E1E1E),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 28.0, top: 29.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DormChef Premium Plan',
                                    style: TextStyle7.textStyle7,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'RM 9.90',
                                        style: TextStyle8.textStyle8,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '/ month',
                                        style: TextStyle9.textStyle9,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 28),
                                  Row(
                                    children: [
                                      Icon(Iconsax.star1,
                                          color: Color(0xFFFDCC0D)),
                                      SizedBox(width: 14),
                                      Text(
                                        'Everything in Free Plan',
                                        style: TextStyle9.textStyle9,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Iconsax.star1,
                                          color: Color(0xFFFDCC0D)),
                                      SizedBox(width: 14),
                                      Text(
                                        'Access to more recipes',
                                        style: TextStyle9.textStyle9,
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Iconsax.star1,
                                          color: Color(0xFFFDCC0D)),
                                      SizedBox(width: 14),
                                      Text(
                                        'Upload Recipe publicly',
                                        style: TextStyle9.textStyle9,
                                      )
                                    ],
                                  ),
                                ],
                              )),
                          Expanded(
                            flex: 3,
                            child: FittedBox(
                              child: Container(
                                height: 183.0,
                                width: 183.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/spaceship.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width - 48,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'view all plans',
                      style: TextStyle10.textStyle10,
                    ),
                  ),
                )
              ],
            ),
          ),

          Positioned(
            top: 824.0,
            left: 24.0,
            child: Container(
              width: 368.0,
              height: 48.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  width: 1.2,
                  color: Color(0xFFDC0201),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                'Report Issue',
                style: TextStyle11.textStyle11,
              ),
              )
              
            ),
          )
        ],
      ),
    );
  }
}
