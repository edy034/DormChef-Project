import 'package:dormchef/models/recipe.dart';
import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:flutter/material.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget(
      {super.key,
      required this.recipe,
      this.imageWidth,
      this.imageHeight,
      this.hasUserDetail = true});

  final Recipe recipe;

  final double? imageWidth;
  final double? imageHeight;
  final bool hasUserDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 232 / 148,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Image.asset(
                'assets/${recipe.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: hasUserDetail ? 16 : 8,
          ),
          Text(
            recipe.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ManropeTextStyles.textStyle(
                fontWeight: FontWeight.w600, fontSize: hasUserDetail ? 16 : 13),
          ),
          if (hasUserDetail)
            const SizedBox(
              height: 8,
            ),
          if (hasUserDetail)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO: Do something when avatar clicked
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/${recipe.userProfile}'),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.userName,
                      style: ManropeTextStyles.textStyle(
                          fontWeight: FontWeight.w600),
                    ),
                    Text(recipe.userId,
                        style: ManropeTextStyles.textStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: const Color(0xFF585858))),
                  ],
                )
              ],
            )
        ],
      ),
    );
  }
}
