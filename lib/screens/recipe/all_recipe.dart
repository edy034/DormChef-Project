import 'package:dormchef/models/recipe.dart';
import 'package:dormchef/widgets/recipe.widget.dart';
import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllRecipe extends StatelessWidget {
  const AllRecipe({super.key});

  static const String routeName = '/all_recipe';

  Future<List<Recipe>> _getRecipes() async {
    // TODO: get from database
    return [
      Recipe(
          image: "nasi goreng sardin.png",
          title: "Nasi Goreng Sardin",
          userId: '@monica',
          userName: "Monica Jenkins",
          userProfile: "monica.png"),
      Recipe(
          image: "maggie kari cheese.JPG",
          title: "Maggie Kari Cheese",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "nasi goreng tauhu kacang buncis.jpg",
          title: "Nasi Goreng Tauhu Kacang Buncis",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "Tauhu sambal tempe.jpg",
          title: "Tauhu Sambal Tempe",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "Sosej sambal merah.jpg",
          title: "Sosej Sambal Merah",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "Telur dadar kentang.jpg",
          title: "Telur Dadar Kentang",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "nasi goreng koboi.jpg",
          title: "Nasi Goreng Koboi",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "pasta olio seafood.jpg",
          title: "Pasto Olio Seafood",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "nasi goreng indonesia.jpg",
          title: "Nasi Goreng Indonesia",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "telur masak paprik.jpg",
          title: "Telur Masak Paprik",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "telur gulung kubis cina.jpg",
          title: "Telur Gulung Kubis Cina",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
      Recipe(
          image: "telur goreng masak kicap.jpg",
          title: "Telur Goreng Masak Kicap",
          userId: '@adammalik',
          userName: "Adam Malik",
          userProfile: "adam_malik.jpg"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                        color: const Color(0xFF444444),
                        borderRadius: BorderRadius.circular(17)),
                    child: const Icon(
                      Iconsax.arrow_left,
                      size: 20,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Recipe of the week",
                style: ManropeTextStyles.textStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFF999999)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(children: [
                    const Icon(
                      Iconsax.search_normal_1,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Search any recipes or chefs',
                      style: ManropeTextStyles.textStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color(0xFF444444)),
                    )
                  ])),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: SizedBox(
                  child: FutureBuilder<List<Recipe>>(
                    future: _getRecipes(),
                    initialData: [],
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 5 / 4),
                        itemBuilder: (context, index) {
                          return RecipeWidget(
                            recipe: snapshot.data[index],
                            hasUserDetail: false,
                          );
                        },
                        itemCount: snapshot.data.length,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
