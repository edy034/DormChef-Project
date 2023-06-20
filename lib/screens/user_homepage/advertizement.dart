import 'package:flutter/material.dart';

class Advertizement extends StatelessWidget {
  const Advertizement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
      child: GestureDetector(
        onTap: () {
          // TODO: Do something when advertize clicked
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 120,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4))
              ]),
          child: Image.asset("images/ads.jpg", fit: BoxFit.cover),
        ),
      ),
    );
  }
}
