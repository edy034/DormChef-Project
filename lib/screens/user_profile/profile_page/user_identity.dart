  import 'dart:io';

  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';
  import 'package:dormchef/widgets/text_style.widget.dart';
  import 'package:provider/provider.dart';

  import '../../../services/provider.service.dart';

  class UserIdentity extends StatefulWidget {
    const UserIdentity({Key? key}) : super(key: key);

    static const String routeName = '/user_identity';

    @override
    State<UserIdentity> createState() => _UserIdentityState();
  }

  /*This class shown user identity including name, profile picture, username and bio.*/

  class _UserIdentityState extends State<UserIdentity> {
    File? profilePicture;
    String fullname = '';
    String username = '';
    String bio = '';

    Future<void> fetchUserData(String uid) async {
      try {
        final userDoc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (userDoc.exists) {
          Map<String, dynamic> userData = userDoc.data()!;
          // Process the userData as needed
          setState(() {
            fullname = userData['fullname'];
            username = userData['username'];
            bio = userData['bio'];
          });
        } else {
          // User document does not exist
          // ignore: avoid_print
          print('User not found');
        }
      } catch (error) {
        // Handle any errors that occur during data fetching
        // ignore: avoid_print
        print('Error fetching user data: $error');
      }
    }

    @override
    void initState() {
      super.initState();
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final String uid = userProvider.uid.toString();
      fetchUserData(uid);
    }

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          // Align is used to align the widget to the center of the screen.
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              // This container is used to contain the name of the user.
              children: <Widget>[
                Container(
                  height: 48.0,
                  width: 300.0,
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
                      fullname,
                      style: ManropeTextStyles.textStyle(
                        color: const Color(0xFF444444),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16.0),

          // This container is used to contain the profile picture, username and bio.
          Column(
            children: [
              const SizedBox(
                // This container is used to contain the profile picture.
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage('images/hafiz.jpg'),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // This text is used to display the username.
              Text(
                // display username
                username,
                style: ManropeTextStyles.textStyle(
                    fontWeight: FontWeight.w400, color: const Color(0xFF585858)),
              ),

              const SizedBox(height: 8),

              // This text is used to display the bio.
              Text(
                // display bio
                bio,
                style:
                    ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
              ),
            ],
          )
        ],
      );
    }
  }
