import 'package:dormchef/models/category.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:dormchef/widgets/category.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  Future<List<Category>> _getCategories() async {
    // TODO: Get categories from database
    /*return [
      Category(title: "Breakfast", svgIcon: 'svgs/sandwich.svg'),
      Category(title: "Lunch", svgIcon: 'svgs/hotdog.svg'),
      Category(title: "Dinner", svgIcon: 'svgs/sushi.svg')
    ];*/

    // TODO: get categories from assets folder
    return [
      Category(title: "Breakfast", svgIcon: 'sandwich.svg'),
      Category(title: "Lunch", svgIcon: 'hotdog.svg'),
      Category(title: "Dinner", svgIcon: 'sushi.svg')
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
              child: Text(
                "Category",
                style: ManropeTextStyles.textStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 70,
              child: FutureBuilder<List<Category>>(
                future: _getCategories(),
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryWidget(
                            category: snapshot.data.elementAt(index),
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
