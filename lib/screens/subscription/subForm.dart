import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/screens/subscription/subscription.dart';
import 'package:dormchef/screens/user_profile/profile_page/profile_main.dart';
import 'package:flutter/material.dart';
//import 'package:dormchef/screens/subscription/subscription.dart';
//import 'package:dormchef/screens/subscription/CurrentPlanScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dormchef/provider.dart';

class SubForm extends StatefulWidget {
  const SubForm({Key? key});

  @override
  _SubFormState createState() => _SubFormState();
}

class _SubFormState extends State<SubForm> {
  final _formKey = GlobalKey<FormState>();

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  late String uid;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    uid = userProvider.uid.toString();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  Future<void> createCard({
    required String cardNo,
    required String cardName,
    required String expiryDate,
    required String secCode,
  }) async {
    final cardoc = FirebaseFirestore.instance.collection('cardDetails').doc();

    final cardDetails = Card(
      id: cardoc.id,
      cardName: cardName,
      cardNo: cardNo,
      expiryDate: expiryDate,
      secCode: secCode,
    );

    final cardJson = cardDetails.toJson();

   // await cardoc.set(cardJson);

    // Update the user's subscription plan to premium in the 'users' collection
    final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
    await userDoc.update({'subscription': 'Dorm Chef Premium Plan'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Subscription(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              const Text(
                "    Your Plan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Row(
                children: [
                  Text(
                    "     RM",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    " 7.99",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                  Text(
                    " /month",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      height: 3,
                    ),
                  ),
                ],
              ),
              const Text("     Cancel Anytime"),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  Image.network(
                    'https://picsum.photos/150',
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 26)),
                      Text("DormChef Premium Plan"),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Text("Everything in Free Plan"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Text("Access to more recipes"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star),
                          Text("Upload recipe publicly"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: Colors.green,
                thickness: 1,
                height: 10,
              ),
              const Text(
                "     Credit Card Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Card number"),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SizedBox(
                      height: 40,
                      width: 350,
                      child: TextField(
                        controller: controller1,
                        decoration: InputDecoration(
                          hintText: 'Enter card number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name on card"),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SizedBox(
                      height: 40,
                      width: 350,
                      child: TextField(
                        controller: controller2,
                        decoration: InputDecoration(
                          hintText: 'Enter text',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expiry date"),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                            height: 40,
                            width: 150,
                            child: TextField(
                              controller: controller3,
                              decoration: InputDecoration(
                                hintText: 'MM/YY',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Security Code"),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                            height: 40,
                            width: 150,
                            child: TextField(
                              controller: controller4,
                              decoration: InputDecoration(
                                hintText: 'CVV',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final cardNo = controller1.text;
                        final cardName = controller2.text;
                        final expiryDate = controller3.text;
                        final secCode = controller4.text;

                        await createCard(
                          cardNo: cardNo,
                          cardName: cardName,
                          expiryDate: expiryDate,
                          secCode: secCode,
                        );

                        // Navigating to the next screen after updating the user's plan
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CurrentPlanScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ),
              const Center(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "If the price changes, we’ll notify beforehand. You can check ",
                    ),
                    Text(
                      "your renewal date or cancel anytime at Account Page.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card {
  String id;
  final String cardNo;
  final String cardName;
  final String expiryDate;
  final String secCode;

  Card({
    this.id = '',
    required this.cardNo,
    required this.cardName,
    required this.expiryDate,
    required this.secCode,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'cardNo': cardNo,
        'cardName': cardName,
        'expiryDate': expiryDate,
        'secCode': secCode,
      };
}
