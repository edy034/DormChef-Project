import 'package:flutter/material.dart';
import 'package:dormchef/screens/text_style.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String textLabel;
  final double spacing;
  final bool readOnly;

  const CustomTextFieldContainer({Key? key,required this.textLabel, required this.controller, required this.hintText, this.spacing = 12, this.readOnly = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textLabel.isNotEmpty)
          Text(
            textLabel,
            style: ManropeTextStyles.textStyle(
              color: const Color(0xFF111111),
            ),
          ),

        SizedBox(height: spacing),

        Container(
          width: 364.0,
          height: 48.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              width: 1.2,
              color: const Color(0xFF999999),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: controller,
                style: const TextStyle(
                  color: Color(0xFF444444),
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Color(0xFF444444),
                  ),
                  border: InputBorder.none,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomPasswordTextFieldContainer extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String textLabel;
  final double spacing;

  const CustomPasswordTextFieldContainer({Key? key, required this.textLabel, required this.controller, required this.hintText, this.spacing = 12,}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomPasswordTextFieldContainerState createState() =>
      _CustomPasswordTextFieldContainerState();
}

class _CustomPasswordTextFieldContainerState
    extends State<CustomPasswordTextFieldContainer> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.textLabel.isNotEmpty)
          Text(
            widget.textLabel,
            style: ManropeTextStyles.textStyle(
              color: const Color(0xFF111111),
            ),
          ),

        SizedBox(height: widget.spacing),

        Container(
          width: 364.0,
          height: 48.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              width: 1.2,
              color: const Color(0xFF999999),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextFormField(
                controller: widget.controller,
                obscureText: !_isPasswordVisible,
                style: const TextStyle(
                  color: Color(0xFF444444),
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    color: Color(0xFF444444),
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xFF444444),
                    ),
                  ),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

