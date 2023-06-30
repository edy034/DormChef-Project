import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddRecipe extends StatelessWidget {
  const AddRecipe({super.key});

  static List<String> pictures = ["telur masak paprik.jpg"];

  static const String routeName = '/add_recipe';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
      child: Column(
        children: [
          _title(),
          const SizedBox(
            height: 16,
          ),
          _content(),
          const SizedBox(
            height: 12,
          ),
          // Submit button
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: const Color(0xFF0B9A61),
            ),
            child: Center(
                child: Text(
              "Post Recipe",
              style: ManropeTextStyles.textStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            )),
          )
        ],
      ),
    );
  }

  Expanded _content() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Recipe Title
            _formTitle(title: "Recipe"),
            const SizedBox(
              height: 14,
            ),
            TextFormField(
                decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 33),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              hintText: "Write your recipe name here..",
              hintStyle: ManropeTextStyles.textStyle(color: Colors.black26),
            )),
            const SizedBox(
              height: 14,
            ),

            // Recipe Type
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _recypeType(text: "Breakfast", value: "Breakfast"),
              const SizedBox(
                width: 16,
              ),
              _recypeType(text: "Lunch", value: "Lunch"),
              const SizedBox(
                width: 16,
              ),
              _recypeType(text: "Dinner", value: "Dinner"),
            ]),
            const SizedBox(
              height: 28,
            ),

            // Attach Picture
            _formTitle(title: "Attach Picture"),
            const SizedBox(
              height: 14,
            ),
            Container(
                height: 107,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF999999))),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => pictures.length != index
                        ? _picture(picture: pictures.elementAt(index))
                        : _addPicture(),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                    itemCount: pictures.length + 1)),

            const SizedBox(
              height: 28,
            ),

            // Add Description
            _formTitle(title: "Add Description"),
            const SizedBox(
              height: 14,
            ),
            TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  hintText: "Write your food description  here...",
                  hintStyle: ManropeTextStyles.textStyle(color: Colors.black26),
                )),
            const SizedBox(
              height: 28,
            ),

            // Add Ingredient
            _formTitle(title: "Add Ingredient"),
            const SizedBox(
              height: 14,
            ),
            TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  hintText:
                      "1. First Ingredient\n2. Second Ingredient\n3. Third Ingredient",
                  hintStyle: ManropeTextStyles.textStyle(color: Colors.black26),
                )),
            const SizedBox(
              height: 28,
            ),
            // Add Method Step
            _formTitle(title: "Add Method Step"),
            const SizedBox(
              height: 14,
            ),
            TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  hintText: "1. First Step\n2. Second Step\n3. Third Step",
                  hintStyle: ManropeTextStyles.textStyle(color: Colors.black26),
                )),
            const SizedBox(
              height: 28,
            ),
          ]),
        ),
      ),
    );
  }

  Widget _addPicture() {
    return GestureDetector(
      onTap: () {
        // TODO: On add picture clicked
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        color: Color(0xFF999999),
        child: SizedBox(
          width: 83,
          height: 83,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Iconsax.add),
            Text(
              "Add picture",
              style: ManropeTextStyles.textStyle(
                  fontSize: 10, color: const Color(0xFF444444)),
            )
          ]),
        ),
      ),
    );
  }

  Widget _picture({required String picture}) {
    return GestureDetector(
      onTap: () {
        // TODO: On picture clicked
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        color: Color(0xFF999999),
        padding: EdgeInsets.zero,
        child: Container(
          width: 83,
          height: 83,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Image.asset("assets/$picture", fit: BoxFit.cover),
        ),
      ),
    );
  }

  RichText _formTitle({required String title, bool isRequired = true}) {
    return RichText(
        text: TextSpan(
            text: "$title ",
            style: ManropeTextStyles.textStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
            children: [
          if (isRequired)
            const TextSpan(
                text: "*", style: TextStyle(color: Color(0xFFDC0201)))
        ]));
  }

  Container _title() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
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
          'Add Recipe',
          style: ManropeTextStyles.textStyle(
            color: const Color(0xFF444444),
          ),
        ),
      ),
    );
  }

  Flexible _recypeType({required String text, required String value}) {
    return Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: GestureDetector(
          onTap: () {
            // TODO: On recipe type clicked
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black26)),
            child: Center(
              child: Text(text, style: ManropeTextStyles.textStyle()),
            ),
          ),
        ));
  }
}
