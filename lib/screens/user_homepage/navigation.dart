import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import 'package:dormchef/screens/recipe/add_recipe.dart';
import 'package:dormchef/screens/user_homepage/home_main.dart';
import 'package:dormchef/screens/user_profile/profile_page/profile_main.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  static const String routeName = '/navigation';

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0; //default page is home page
  static const TextStyle optionStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeMain(),
    Text(
      'Search',
      style: optionStyle,
    ),
    AddRecipe(),
    Text(
      'Bookmark',
      style: optionStyle,
    ),
    ProfileMain(),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal_1),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.add_square),
            label: 'Add',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Iconsax.bookmark),
            label: 'Bookmark',
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0B9A61),
        unselectedItemColor: const Color(0xFF999999),
        onTap: _onItemTapped,
      ),
    );
  }
}
