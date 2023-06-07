import 'package:dormchef/models/category.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: On category clicked
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4))
            ]),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: SvgPicture.asset('assets/svgs/${category.svgIcon}'),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              category.title,
              style: ManropeTextStyles.textStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
