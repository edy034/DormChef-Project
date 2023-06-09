import 'package:dormchef/models/category.dart';
import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:dormchef/widgets/category.widget.dart';
import 'package:flutter/material.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  Future<List<Category>> _getCategories() async {
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
