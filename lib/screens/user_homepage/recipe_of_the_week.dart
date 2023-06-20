import 'package:dormchef/models/recipe.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:dormchef/screens/recipe/all_recipe.dart';
import 'package:dormchef/widgets/recipe.widget.dart';
import 'package:flutter/material.dart';

class Recipes extends StatelessWidget {
  const Recipes({super.key});

  Future<List<Recipe>> _getRecipes() async {
    // TODO: get from database
    return [
      Recipe(
          image: "images/nasi-goreng-sardin.png",
          title: "Nasi Goreng Sardin",
          userId: '@monica',
          userName: "Monica Jenkins",
          userProfile: "images/monica.png"),
      Recipe(
          image: "images/maggie-kari-cheese.jpeg",
          title: "Maggie Kari Cheese",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "images/adam_malik.jpg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 32,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recipe of the week",
                    style: ManropeTextStyles.textStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: On see all tapped
                      Navigator.of(context).pushNamed(AllRecipe.routeName);
                    },
                    child: Text(
                      "see all",
                      style: ManropeTextStyles.textStyle(
                          color: const Color(0xFF0056FB)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 240,
              child: FutureBuilder(
                future: _getRecipes(),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => RecipeWidget(
                            recipe: snapshot.data.elementAt(index),
                            imageHeight: 148,
                            imageWidth: 232,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 16,
                          ),
                      itemCount: snapshot.data.length);
                },
              ),
            )
          ]),
    );
  }
}
