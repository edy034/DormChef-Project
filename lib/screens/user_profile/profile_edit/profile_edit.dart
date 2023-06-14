import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:dormchef/screens/input_text.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/profile_edit';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? profilePicture;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
    Future<void> fetchUserData(String uid) async {
    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data()!;
        // Process the userData as needed
        _fullNameController.text = userData['fullname'];
        _phoneController.text = userData['phone'].toString();
        _usernameController.text = userData['username'];
        _emailController.text = userData['email'];
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // This is the icon for the back button
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Navigate back to the previous screen by popping the current screen
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                onTap: () async {
                  // Handle the tap event, open the album to select a new profile picture
                  // You can use image_picker package to access the album and select an image
                  // Here's an example using image_picker package:

                  // Import the image_picker package

                  // Open the album to select an image
                  final ImagePicker picker = ImagePicker();
                  final XFile? pickedImage =
                      await picker.pickImage(source: ImageSource.gallery);

                  // Check if an image is picked and update the profile picture if available
                  if (pickedImage != null) {
                    // Use the picked image and update the profile picture
                    // You can save the image to storage or upload it to a server
                    // and update the profile picture accordingly
                    // For example:
                    setState(() {
                      // Update the profile picture with the picked image
                      profilePicture = File(pickedImage.path);
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 64,
                      backgroundImage: profilePicture != null
                          ? FileImage(profilePicture!) as ImageProvider<Object>
                          : const AssetImage('images/hafiz.jpg'),
                    ),
                  ),
                )),

            const SizedBox(height: 68),

            CustomTextFieldContainer(
                textLabel: 'Name',
                controller: _fullNameController,
                hintText: 'Hafiz Ahmad'),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
                textLabel: 'Username',
                controller: _usernameController,
                hintText: '@hafizahd'),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
                textLabel: 'Email Address',
                controller: _emailController,
                hintText: 'hafiz@graduate.utm.my'),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
                textLabel: 'Phone Number',
                controller: _phoneController,
                hintText: '0123456789'),

            const SizedBox(height: 36),

            // Text span
            Text.rich(TextSpan(children: [
              TextSpan(
                text: 'Joined',
                style: ManropeTextStyles.textStyle(),
              ),
              TextSpan(
                text: ' 2 March 2023',
                style: ManropeTextStyles.textStyle(fontWeight: FontWeight.w700),
              ),
            ])),

            const SizedBox(height: 36),

            GestureDetector(
              /*onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Navigation()))
                },*/
              child: Container(
                  width: 364.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xFF0B9A61),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Continue',
                          style: ManropeTextStyles.textStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF))))),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> fetchUsersData() async {}
