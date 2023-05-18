import 'package:flutter/material.dart';


class Subscription extends StatelessWidget {
  const Subscription({super.key});


  @override
  Widget build(BuildContext context) {

  bool isButtonSelected = false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){},
                ),
        
      ),

      body:SingleChildScrollView(
        child:Column(
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topLeft,
              child:const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose a plan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Select the offer the best suits your need"),
                    
                    Text(
                      "\n\nYou active plan: DormChef Free Plan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),

            ),
              
          Container(
            //padding: EdgeInsets.all(23),
            height: 180,
            width: 350,
            
            decoration: BoxDecoration(
             color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
             ),

            child: TextButton(
                
                onPressed: () {},
                
            
              child:Column(
                children: [
                  const Padding(padding: EdgeInsets.only(left:32, top:20, right:0,bottom:0)),
                
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left:45)),
                      Image.network(
                        'https://picsum.photos/150',
                        height: 60,
                        width: 60,
                      
                        //fit: BoxFit.cover,
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
                            style:TextStyle(
                              color: Colors.black54,
                            ),
                            
                          ),
                        ],
                      ),
                    
                    ],
                  ),
                
                  const Padding(padding: EdgeInsets.only(top:20)),
                
                  const Column(
                    children: [
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left:30, top:10, right:10, bottom:0)),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                          ),

                          Text("Access to limited recipe",
                          style:TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left:30, top:10, right:10, bottom:0)),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                          ),

                          Text(
                            "Personalized Recipe Recommendation",
                            style:TextStyle(
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

          const Padding(padding: EdgeInsets.only(top:30)),

           Container(
            //padding: EdgeInsets.all(23),
            height: 220,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
             ),
                         
            child:TextButton(
              
              onPressed: (){
                
              },
              

              
            
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(left:32, top:20, right:0,bottom:0)),
                
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left:45)),
                    Image.network(
                      'https://picsum.photos/150',
                      height: 60,
                      width: 60,
                      
                      //fit: BoxFit.cover,
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
                          style:TextStyle(
                              color: Colors.black54,
                          ),  
                        ),
                      ],
                    ),
                    
                  ],
                ),
                
                const Padding(padding: EdgeInsets.only(top:20)),
                
                const Column(
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left:30, top:10, right:10, bottom:0)),
                        Icon(
                          Icons.star,
                          color: Colors.black,
                        ),

                        Text(
                          "Everything in Free Plan",
                          style:TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                      ],
                    ),

                     Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left:30, top:10, right:10, bottom:0)),
                        Icon(
                          Icons.star,
                          color: Colors.black,  
                        ),

                        Text(
                          "Access to more recipes",
                          style:TextStyle(
                              color: Colors.black54,
                          ),  
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left:30, top:10, right:10, bottom:0)),
                        Icon(
                          Icons.star,
                          color: Colors.black,
                        ),

                        Text(
                          "Upload recipe publicly",
                          style:TextStyle(
                              color: Colors.black54,
                          ),  
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left:30, top:10, right:10, bottom:0)),
                        Icon(Icons.star,color:Colors.black),

                        Text(
                          "Personalized Recipe Recommendation",
                          style:TextStyle(
                            color: Colors.black54,
                          ),  
                        ),
                      ],
                    ),
                  ],
                ),
            
              ],
            ),
            )
            
            
          ),

          
        
 //continue button         
/*
          Container(
            padding: EdgeInsets.only(top:10),
            width: 300,
            height: 60,
            child: ElevatedButton(
                onPressed: () {},
                child: Text('Continue'),
            ),
          ),
*/
          const Center(
            child:Column(
              children: [
                Padding(padding: EdgeInsets.only(top:10)),
                Text(
                "Terms and Conditions apply. 1 month free trial not available",
                ),

                Text(
                "for Premium Plan’s user.",
                ),
              ],
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
          ),
    );
  }
}
