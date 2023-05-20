import 'package:dormchef/homepage.dart';
import 'package:flutter/material.dart';
import 'package:dormchef/issueRep.dart';
import 'package:dormchef/subscription.dart';
import 'package:dormchef/BookmarkPage.dart';
import 'package:dormchef/addPage.dart';
import 'package:dormchef/SearchPage.dart';
import 'package:dormchef/profile_page.dart';

class SubForm extends StatelessWidget {
  const SubForm({super.key});

  @override
  Widget build(BuildContext context) {
   
   int selectedIndex = 2;

    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTapped(int index) {
     //  print(index);
      selectedIndex = index;
      print(selectedIndex);

       switch (index) {
      case 0:
        Navigator.of(context).push(
                    MaterialPageRoute(  //untuk pergi page lain
                    builder: (context) => const IssueRep(),
                 )
        );
        break;
      case 1:
         Navigator.of(context).push(
                    MaterialPageRoute(  //untuk pergi page lain
                    builder: (context) => const IssueRep(),
                 )
        );
        break;
      case 2:
         Navigator.of(context).push(
                    MaterialPageRoute(  //untuk pergi page lain
                    builder: (context) => const IssueRep(),
                 )
        );
        break;
      case 3:
        Navigator.of(context).push(
                    MaterialPageRoute(  //untuk pergi page lain
                    builder: (context) => const IssueRep(),
                 )
        );
        break;
      case 4:
         Navigator.of(context).push(
                    MaterialPageRoute(  //untuk pergi page lain
                    builder: (context) => const ProfilePage(),
                 )
        );
        break;
    }
      //print(index);
    }


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(  //untuk pergi page lain
                        builder: (context) => const Subscription(),
                      )
                    );
                  },
                ),
        
      ),

      body:SingleChildScrollView(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top:30)),
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
                style:TextStyle(
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
                color:Colors.grey,
                height: 3,// set the font size to 20
                ),
              ),
            ],

            
          ),

          
          
          const Text("     Cancel Anytime"),

          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left:15)),
              Image.network(
                'https://picsum.photos/150',
                height: 80,
                width: 80,
                
              ),
              
              const SizedBox(width: 16),
              
              const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top:26)),
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
            padding: const EdgeInsets.only(left:20,top:15),
            child:const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Card number"),
                Padding(padding: EdgeInsets.only(top:10)),
                SizedBox(
                  height: 40,
                  width: 350,
                  child:TextField(
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
            padding: const EdgeInsets.only(left:20,top:15),
            child:const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter card number"),
                Padding(padding: EdgeInsets.only(top:10)),
                SizedBox(
                  height: 40,
                  width: 350,
                  child:TextField(
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
            padding: const EdgeInsets.only(left:20,top:15),
            child:const Row(
              children: [
                Expanded(
                  child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Expiry date"),
                            Padding(padding: EdgeInsets.only(top:10)),
                            SizedBox(
                              height: 40,
                              width: 150,
                              child:TextField(
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
                  child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Security Code"),
                            Padding(padding: EdgeInsets.only(top:10)),
                            SizedBox(
                              height: 40,
                              width: 150,
                              child:TextField(
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
          
          const Padding(padding: EdgeInsets.only(top:10)),
          Center(
          child:  
          Container(
            padding: const EdgeInsets.only(top:10),
            width: 300,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                    Navigator.of(context).push(
                    MaterialPageRoute(  //untuk pergi page lain
                    builder: (context) => const IssueRep(),
                 ),
                );
                },
                child: const Text('Continue'),
            ),
          ),
          ),

          const Center(
            child:Column(
              children: [
                Padding(padding: EdgeInsets.only(top:10)),
                Text(
                "If the price changes, we’ll notify before hand. You can check ",
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

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          //currentIndex: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
               // backgroundColor: Colors.black,
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                label: 'Add',
              ),
             BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],

            backgroundColor: Colors.pink,
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.grey,
//            onTap: _onItemTapped,
            
            
            
          ),
    );
    
  }

 

  
}