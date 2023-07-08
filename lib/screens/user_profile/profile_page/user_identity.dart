import 'package:flutter/material.dart';
import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:dormchef/services/profile.service.dart';
import 'package:dormchef/services/storage.service.dart';
import 'package:dormchef/models/users.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:convert';

class UserIdentity extends StatefulWidget {
  const UserIdentity({Key? key}) : super(key: key);

  static const String routeName = '/user_identity';

  @override
  State<UserIdentity> createState() => _UserIdentityState();
}

/*This class shown user identity including name, profile picture, username and bio.*/

class _UserIdentityState extends State<UserIdentity> {
  String? message;
  String? firstname;
  String? lastname;
  String? fullname;
  String? username;
  String? profilePic;
  String? bio;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    message = await ProfileService.fetchUserData(context);
    if (message!.toLowerCase().contains('error')) {
      showTopSnackBar(
        // ignore: use_build_context_synchronously
        Overlay.of(context),
        CustomSnackBar.error(
          message: message!,
        ),
      );
    } else {
      setState(() {
        Users user = Users.fromJson(jsonDecode(message!));
        firstname = user.firstname;
        lastname = user.lastname;
        fullname = '$firstname $lastname';
        username = user.username;
        profilePic = user.profilePic;
        bio = user.bio;
      });
    }
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
                    fullname.toString(),
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
            SizedBox(
              // This container is used to contain the profile picture.
              child: FutureBuilder<String?>(
                future: StorageService.readImage(profilePic.toString()),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(snapshot.data.toString()),
                    );
                  } else {
                    return const CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage('images/hafiz.jpg'),
                    );
                  }
                }
              )
            ),

            const SizedBox(height: 8),

            // This text is used to display the username.
            Text(
              // display username
              username.toString(),
              style: ManropeTextStyles.textStyle(
                  fontWeight: FontWeight.w400, color: const Color(0xFF585858)),
            ),

            const SizedBox(height: 8),

            // This text is used to display the bio.
            Text(
              // display bio
              bio.toString(),
              style:
                  ManropeTextStyles.textStyle(color: const Color(0xFF444444)),
            ),
          ],
        )
      ],
    );
  }
}