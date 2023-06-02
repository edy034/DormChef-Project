import 'package:flutter/material.dart';
import 'package:dormchef/screens/text_style.dart';

class UserIdentity extends StatefulWidget {
  const UserIdentity({Key? key}) : super(key: key);

  static const String routeName = '/user_identity';

  @override
  State<UserIdentity> createState() => _UserIdentityState();
}

/*This class shown user identity including name, profile picture, username and bio.*/

class _UserIdentityState extends State<UserIdentity> {
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
                  'Hafiz Ahmad',
                  style: ManropeTextStyles.textStyle(color: const Color(0xFF444444),),
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
                  backgroundImage: AssetImage('assets/hafiz.jpg'),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // This text is used to display the username.
            Text(
              '@hafizahd',
              style: ManropeTextStyles.textStyle(fontWeight: FontWeight.w400, color: const Color(0xFF585858)),),
            
            const SizedBox(height: 8),
            
            // This text is used to display the bio.
            Text(
              'This person is lazy to set a bio',
              style: ManropeTextStyles.textStyle(color: const Color(0xFF444444)),),
          ],
        )
      ],
    );
  }
}
