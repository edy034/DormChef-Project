import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/services/provider.service.dart';
import 'package:dormchef/services/profile.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:dormchef/widgets/text_field.widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/profile_edit';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? profilePicture;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> fetchUserData(String uid) async {
    try {
      print(uid);
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data()!;
        // Process the userData as needed
        _firstNameController.text = userData['firstname'];
        _lastNameController.text = userData['lastname'];
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
    // print("hai:"+uid);
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
                  final ImagePicker picker = ImagePicker();
                  final XFile? pickedImage =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (pickedImage != null) {
                    setState(() {
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
                textLabel: 'First Name',
                controller: _firstNameController,
                hintText: 'First Name'),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
                textLabel: 'Last Name',
                controller: _lastNameController,
                hintText: 'Last Name'),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
                textLabel: 'Username',
                controller: _usernameController,
                hintText: '@username'),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
              textLabel: 'Email Address',
              controller: _emailController,
              hintText: '',
              readOnly: true,
            ),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
                textLabel: 'Phone Number',
                controller: _phoneController,
                hintText: ''),
            const SizedBox(height: 36),
            GestureDetector(
              onTap: () async {
                // Update user data in Firestore
                String? message = await ProfileService.updateUserData(
                    context,
                    _firstNameController.text,
                    _lastNameController.text,
                    _phoneController.text,
                    _usernameController.text);
                if (message!.contains('success')) {
                  showTopSnackBar(
                    // ignore: use_build_context_synchronously
                    Overlay.of(context),
                    CustomSnackBar.success(
                      message: message,
                    ),
                  );
                } else {
                  showTopSnackBar(
                    // ignore: use_build_context_synchronously
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: message,
                    ),
                  );
                }

                // Fetch the updated user data
                // ignore: use_build_context_synchronously
                String? user = await ProfileService.fetchUserData(context);
                if (user != null) {
                  //decode the user data
                  Map<String, dynamic> userData = jsonDecode(user);
                  _firstNameController.text = userData['firstname'];
                  _lastNameController.text = userData['lastname'];
                  _phoneController.text = userData['phone'].toString();
                  _usernameController.text = userData['username'];
                  _emailController.text = userData['email'];

                  showTopSnackBar(
                    // ignore: use_build_context_synchronously
                    Overlay.of(context),
                    const CustomSnackBar.success(
                      message: 'User data successfully updated',
                    ),
                  );

                } else {
                  showTopSnackBar(
                    // ignore: use_build_context_synchronously
                    Overlay.of(context),
                    const CustomSnackBar.error(
                      message: 'Error fetching user data',
                    ),
                  );
                }
              },
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
