import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/screens/text_style.dart';

class UserPlan extends StatefulWidget {
  const UserPlan({Key? key}) : super(key: key);

  @override
  State<UserPlan> createState() => _UserPlanState();
}

/*This class shown user's active subsription plan. List of subscription plan 
  will be displayed when the card being pressed.*/

class _UserPlanState extends State<UserPlan> {
  List<String> texts = [
    'Everything in Free Plan', 'Access to more recipes', 'Upload Recipe publicly'
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // This is the widget for the active plan
        Text(
          'Active Plan',
          style: ManropeTextStyles.textStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Your currently is Dormchef Premium Plan\'s User',
          style: ManropeTextStyles.textStyle(color: const Color(0xFF000000)),
        ),

        const SizedBox(height: 12),

        // This is the widget for the subscription plan card
        Container(
          height: 208.0,
          width: 364.0,

          // Add border radius and gradient to the card
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0297, 0.9688],
              colors: [
                const Color(0xFF88FFC9).withOpacity(1.0),
                const Color(0xFFFFEC42).withOpacity(0.0),
              ],
              transform:
                  const GradientRotation(10.21 * (3.1415926535897932 / 180)),
            ),
            border: Border.all(
              width: 1.2,
              color: const Color(0xFF1E1E1E),
            ),
          ),

          // Add padding to the card
          child: Padding(
              padding: const EdgeInsets.only(left: 28.0, top: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // This is the widget for the subscription plan details
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('DormChef Premium Plan',
                            style: PoppinsTextStyles.textStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        Row(
                          children: [
                            Text('RM 9.90',
                                style: PoppinsTextStyles.textStyle(
                                  fontWeight: FontWeight.w600,
                                )),
                            const SizedBox(width: 4),
                            Text('/ month',
                                style: PoppinsTextStyles.textStyle(
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),

                        // Loop through the list of texts
                        for (var text in texts)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Iconsax.star1,
                                  color: Color(0xFFFDCC0D),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  text,
                                  style: PoppinsTextStyles.textStyle(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF444444),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                  // This is the widget for the spaceship image
                  Expanded(
                    flex: 3,
                    child: FittedBox(
                      child: Container(
                        height: 183.0,
                        width: 183.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/spaceship.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  )
                  
                ],
              )),
        ),
      ],
    ),
    );
  }
}
