import 'package:dormchef/screens/issueReport/issueRep.dart';
import 'package:flutter/material.dart';
import 'package:dormchef/widgets/text_style.widget.dart';

class ReportIssue extends StatelessWidget {
  const ReportIssue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle button click and navigate to another page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IssueRep()),
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 368.0,
          height: 48.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              width: 1.2,
              color: Color(0xFFDC0201),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Report Issue',
              style: ManropeTextStyles.textStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFDC0201),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
