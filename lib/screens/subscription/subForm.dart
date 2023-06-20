import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dormchef/screens/subscription/subscription.dart';
import 'package:dormchef/screens/subscription/CurrentPlanScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class SubForm extends StatelessWidget {
  const SubForm({Key? key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final controller1 = TextEditingController();
    final controller2 = TextEditingController();
    final controller3 = TextEditingController();
    final controller4 = TextEditingController();

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
              Text(
                "Your Plan",
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B9A61),
                ),
              ),
              Row(
                children: [
                  Text(
                    "RM",
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B9A61),
                    ),
                  ),
                  Text(
                    " 7.99",
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B9A61),
                    ),
                  ),
                  Text(
                    " /month",
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B9A61),
                    ),
                  ),
                ],
              ),
              Text(
                "Cancel Anytime",
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B9A61),
                ),
              ),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  Image.network(
                    'https://picsum.photos/150',
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 26)),
                      Text(
                        "DormChef Premium Plan",
                        style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.green),
                          Text(
                            "Everything in Free Plan",
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.green),
                          Text(
                            "Access to more recipes",
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.green),
                          Text(
                            "Upload recipe publicly",
                            style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
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
              Text(
                "Credit Card Details",
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0B9A61),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card number",
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B9A61),
                      ),
                    ),
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
                    Text(
                      "Name on card",
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B9A61),
                      ),
                    ),
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
                          Text(
                            "Expiry date",
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0B9A61),
                            ),
                          ),
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
                          Text(
                            "Security Code",
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0B9A61),
                            ),
                          ),
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
                     /*   Navigator.of(context).push(
                          MaterialPageRoute(
                          //  builder: (context) => const CurrentPlanScreen(),
                          ),
                        );*/
                      }
                    },
                    child: Text(
                      'Continue',
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B9A61),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      "If the price changes, we’ll notify before hand. You can check ",
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B9A61),
                      ),
                    ),
                    Text(
                      "your renewal date or cancel anytime at Account Page.",
                      style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B9A61),
                      ),
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

  Future<void> createCard(
      {required String cardNo, cardName, expiryDate, secCode}) async {
    final cardoc = FirebaseFirestore.instance.collection('cardDetails').doc();
    //  final userId = FirebaseAuth.instance.currentUser!.uid; // get the current user's ID here
    // final userId = FirebaseFirestore.instance.collection('users').doc(userId);

    final cardDetails = Card(
      id: cardoc.id,
      cardName: cardName,
      cardNo: cardNo,
      expiryDate: expiryDate,
      secCode: secCode,
    );

    final cardJson = cardDetails.toJson();

    await cardoc.set(cardJson);

    // Update the user's subscription plan to premium in the 'users' collection
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc("userId");
    await userDoc.update({'subscriptionPlan': 'Dorm Chef Premium Plan'});
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
