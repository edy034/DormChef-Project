import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
      child: GestureDetector(
        onTap: () {
          // TODO: Do something when search clicked
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4))
              ]),
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
          ]),
        ),
      ),
    );
  }
}
