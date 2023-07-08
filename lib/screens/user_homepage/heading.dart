import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:flutter/material.dart';
import 'package:dormchef/services/profile.service.dart';
import 'package:dormchef/services/storage.service.dart';
import 'package:dormchef/models/users.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:convert';

class Heading extends StatelessWidget {
  const Heading({Key? key}) : super(key: key);

  Future<String> fetchData(BuildContext context) async {
    final message = await ProfileService.fetchUserData(context);
    return message!;
  }

  @override
Widget build(BuildContext context) {
  return FutureBuilder<String>(
    future: fetchData(context),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Data is still loading
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // Error occurred while fetching data
        return Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        // Data fetched successfully
        final message = snapshot.data!;

        if (message.toLowerCase().contains('error')) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              message: message,
            ),
          );
        } else {
          final user = Users.fromJson(jsonDecode(message));
          final firstname = user.firstname;
          final lastname = user.lastname;
          final fullname = '$firstname $lastname';
          final profilePic = user.profilePic;

          return Padding(
            padding: const EdgeInsets.only(top: 72, left: 24, right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, $fullname",
                      style: ManropeTextStyles.textStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: const Color(0xFF444444),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "What would you like to \ncook today?",
                      style: ManropeTextStyles.textStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: const Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                FutureBuilder(
                  future: StorageService.readImage(profilePic),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Data is still loading
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Error occurred while fetching data
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      // Data fetched successfully
                      final url = snapshot.data!;

                      return Container( 
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }

                    // Return a default Widget or throw an exception
                    return Container(); // Default Widget
                    // throw Exception('Unexpected error occurred.'); // Throw an exception
                  },
                ),
              ],
            ),
          );
        }
      }
      
      // Return a default Widget or throw an exception
      return Container(); // Default Widget
      // throw Exception('Unexpected error occurred.'); // Throw an exception
    },
  );
}

}

