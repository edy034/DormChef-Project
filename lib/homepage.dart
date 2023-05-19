import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:dormchef/SearchPage.dart';
import 'package:dormchef/AddPage.dart';
import 'package:dormchef/BookmarkPage.dart';
import 'package:dormchef/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; //default page is home page
  static const TextStyle optionStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Add',
      style: optionStyle,
    ),
    Text(
      'Bookmark',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',

          ),
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal_1),
            label: 'Search',

          ),
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.add),
            label: 'Add',

          ),
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.bookmark),
            label: 'Bookmark',

          ),
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.profile),
            label: 'Profile',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0B9A61),
        onTap: _onItemTapped,
      ),
    );
  }
}
