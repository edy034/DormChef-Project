import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/screens/subscription/subForm.dart';
import 'package:dormchef/screens/user_profile/profile_page/profile_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dormchef/provider.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  late String uid;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    uid = userProvider.uid.toString();
    fetchUserData(uid);
  }

  void fetchUserData(String uid) {
    // Implement your logic to fetch user data from Firebase
    // using the provided UID
    // ...
  }

  void updateSubscriptionPlan(String userId, String subscriptionPlan) {
    // Implement your logic to update the subscription plan in Firebase
     FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'subscription': subscriptionPlan})
        .then((_) {
      // Subscription plan updated successfully
      // You can perform any additional actions here if needed
      print('Subscription plan updated: $subscriptionPlan');
    })
    .catchError((error) {
      // An error occurred while updating the subscription plan
      // Handle the error accordingly
      print('Failed to update subscription plan: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonSelected = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ProfileMain(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose a plan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Select the offer that best suits your needs"),
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data =
                            snapshot.data!.data() as Map<String, dynamic>?;

                        if (data != null) {
                          final subscriptionPlan =
                              data['subscription'] as String? ??
                                  'DormChef Free Plan';

                          return Text(
                            "\n\nYour active plan: $subscriptionPlan",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      }

                      return SizedBox();
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 180,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton(
                onPressed: () {
                  updateSubscriptionPlan(uid, 'Dorm Chef Free Plan');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CurrentPlanScreen(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 32, top: 20, right: 0, bottom: 0)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 45)),
                        Image.network(
                          'https://picsum.photos/150',
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DormChef Free Plan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Free",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 0)),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            Text(
                              "Access to limited recipes",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 0)),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            Text(
                              "Personalized Recipe Recommendation",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              height: 220,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SubForm(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 32, top: 20, right: 0, bottom: 0)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 45)),
                        Image.network(
                          'https://picsum.photos/150',
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DormChef Premium Plan",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "RM7.99 / month",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    const Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 0)),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            Text(
                              "Everything in Free Plan",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 0)),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            Text(
                              "Access to more recipes",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 0)),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                            Text(
                              "Upload recipe publicly",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30, top: 10, right: 10, bottom: 0)),
                            Icon(Icons.star, color: Colors.black),
                            Text(
                              "Personalized Recipe Recommendation",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentPlanScreen extends StatelessWidget {
  const CurrentPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Plan'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Subscription Successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*

class SubForm extends StatefulWidget {
  const SubForm({Key? key}) : super(key: key);

  @override
  _SubFormState createState() => _SubFormState();
}

class _SubFormState extends State<SubForm> {
  late String uid;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    uid = userProvider.uid.toString();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _expDateController.dispose();
    super.dispose();
  }

  void subscribeToPremiumPlan(String uid, String name, String cardNumber, String expDate) {
    // Implement your logic to subscribe the user to the premium plan
    // using the provided data and update the subscription plan in Firebase
    // ...

    // After successful subscription, navigate to the current plan screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CurrentPlanScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscribe to Premium Plan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name on Card',
              ),
            ),
            TextFormField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Card Number',
              ),
            ),
            TextFormField(
              controller: _expDateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                labelText: 'Expiration Date',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final cardNumber = _cardNumberController.text;
                final expDate = _expDateController.text;

                // Validate the form data before subscribing
                if (name.isNotEmpty && cardNumber.isNotEmpty && expDate.isNotEmpty) {
                  subscribeToPremiumPlan(uid, name, cardNumber, expDate);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Validation Error'),
                      content: const Text('Please fill in all the fields.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Subscribe'),
            ),
          ],
        ),
      ),
    );
  }
}

*/