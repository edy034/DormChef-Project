import 'package:flutter/material.dart';
import 'package:dormchef/subForm.dart';


class IssueRep extends StatelessWidget {
  const IssueRep({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){    //untuk pergi page lain
                    Navigator.of(context).push(
                    MaterialPageRoute(  //untuk pergi page lain
                    builder: (context) => const SubForm(),
                 ),
                );

                  },
                ),
        
      ),


      body:SingleChildScrollView(
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top:40)),
          const Text("     Quick Access"),
          const Row(
            //Padding(padding: EdgeInsets.only(top:20)),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  //Padding(padding: EdgeInsets.only(top:20)),
                  Icon(Icons.circle),
                  Text("Account Recovery"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle),
                  Text("Account Recovery"),
                ],
              ),
            ],
          ),

          const Padding(padding: EdgeInsets.only(top:30)),

          const Text(
            "    Tell us your feeback",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text("    For extra safety, do not provide personal information"),
          Container(
            padding: const EdgeInsets.only(left:15,right:20),
            //width: 100,
            child: TextField(
              minLines: 8,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
              hintText: 'Enter your text',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              ),
            ),
          ),

          const Padding(padding: EdgeInsets.only(top:20)),
          const Text("    Attachment"),
          Container(
            padding: const EdgeInsets.only(left:15,right:20),
            //width: 100,
            child: TextField(
              minLines: 5,
              maxLines: 7,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
              hintText: 'Enter your text',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              ),
            ),
          ),
          
          Center(
           child: Container(
            padding: const EdgeInsets.only(top:10),
            width: 300,
            height: 60,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text('Submit Report'),
             ),
            ),
          ),

        ],
      ),
    ),
      
      bottomNavigationBar: BottomNavigationBar(
            //currentIndex: 1,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.black,
                label: 'Friends',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Pending',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                label: 'Pending',
              ),
             BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Pending',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Pending',
              ),
            ],
          )
    );
  }
}