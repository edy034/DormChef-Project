import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/widgets/text_style.widget.dart';
import 'package:dormchef/screens/subscription/subscription.dart';

class UserPlan extends StatefulWidget {
  const UserPlan({Key? key}) : super(key: key);

  @override
  State<UserPlan> createState() => _UserPlanState();
}

class _UserPlanState extends State<UserPlan> {
  List<String> texts = [
    'Everything in Free Plan',
    'Access to more recipes',
    'Upload Recipe publicly',
  ];

  void _navigateToSubscriptionPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Subscription()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToSubscriptionPage, // Navigate to the subscription page
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            'You are currently a Dormchef Premium Plan user',
            style: ManropeTextStyles.textStyle(color: const Color(0xFF000000)),
          ),
          const SizedBox(height: 12),

          // This is the widget for the subscription plan card
          Container(
            height: 208.0,
            width: 364.0,
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
                        Text(
                          'DormChef Premium Plan',
                          style: PoppinsTextStyles.textStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'RM 9.90',
                              style: PoppinsTextStyles.textStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '/ month',
                              style: PoppinsTextStyles.textStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Page'),
      ),
      body: Center(
        child: Text(
          'This is the subscription page.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dormchef/screens/text_style.dart';
import 'package:dormchef/screens/subscription/subscription.dart';

class UserPlan extends StatefulWidget {
  const UserPlan({Key? key}) : super(key: key);

  @override
  State<UserPlan> createState() => _UserPlanState();
}

class _UserPlanState extends State<UserPlan> {
  List<String> texts = [
    'Everything in Free Plan',
    'Access to more recipes',
    'Upload Recipe publicly',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the other page when the card is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Subscription()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            style: ManropeTextStyles.textStyle(
              color: const Color(0xFF000000),
            ),
          ),
          const SizedBox(height: 12),
          // Rest of the widget code...
        ],
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Center(
        child: Text(
          'This is the other page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}




*/