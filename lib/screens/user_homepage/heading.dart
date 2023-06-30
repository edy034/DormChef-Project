import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 72, left: 24, right: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, Hafidz",
                style: ManropeTextStyles.textStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: const Color(0xFF444444)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text("What would you like to \ncook today?",
                  style: ManropeTextStyles.textStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: const Color(0xFF000000)))
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // TODO: Do something when avatar clicked
            },
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('images/hafiz.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
