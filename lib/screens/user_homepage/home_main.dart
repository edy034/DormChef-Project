import 'package:dormchef/screens/user_homepage/advertizement.dart';
import 'package:dormchef/screens/user_homepage/categories.dart';
import 'package:dormchef/screens/user_homepage/heading.dart';
import 'package:dormchef/screens/user_homepage/recipe_of_the_week.dart';
import 'package:dormchef/screens/user_homepage/search_input.dart';
import 'package:flutter/material.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  static const String routeName = '/home_main';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: const [
          Heading(),
          SearchInput(),
          Advertizement(),
          Categories(),
          Recipes()
        ],
      ),
    );
  }
}
