import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/newStyle.dart';

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
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Positioned(
                top: 54.0,
                left: MediaQuery.of(context).size.width / 2 - 54.0,
                child: Row(
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
                          style: ManropeTextStyles.textStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Container(
                      height: 34.0,
                      width: 34.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xFF444444),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Iconsax.notification,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
