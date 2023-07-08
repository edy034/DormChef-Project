import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dormchef/widgets/text_field.widget.dart';
import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dormchef/services/profile.service.dart';
import 'package:dormchef/models/user.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const String routeName = '/profile_edit';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? profilePicture;
  String? message;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
        _firstNameController.text = user.firstname;
        _lastNameController.text = user.lastname;
        _phoneController.text = user.phone;
        _usernameController.text = user.username;
        _emailController.text = user.email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Navigate back to the previous screen by popping the current screen
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF0B9A61),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                hintText: 'Hafiz'),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
                textLabel: 'Last Name',
                controller: _lastNameController,
                hintText: 'Ahmad'),
            CustomTextFieldContainer(
                textLabel: 'Username',
                controller: _usernameController,
                hintText: '@hafizahd'),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
              textLabel: 'Email Address',
              controller: _emailController,
              hintText: 'hafiz@graduate.utm.my',
              readOnly: true,
            ),
            const SizedBox(height: 18),
            CustomTextFieldContainer(
                textLabel: 'Phone Number',
                controller: _phoneController,
                hintText: '0123456789'),
            const SizedBox(height: 36),
            GestureDetector(
              onTap: () async {
                message = await ProfileService.updateUserData(
                    context,
                    _firstNameController.text,
                    _lastNameController.text,
                    _phoneController.text,
                    _usernameController.text);
                if (message!.toLowerCase().contains('success')) {
                  showTopSnackBar(
                    // ignore: use_build_context_synchronously
                    Overlay.of(context),
                    CustomSnackBar.success(
                      message: message!,
                    ),
                  );

                  // Re-render page
                  setState(() {});
                } else {
                  showTopSnackBar(
                    // ignore: use_build_context_synchronously
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: message!,
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
                      child: Text('Update',
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
