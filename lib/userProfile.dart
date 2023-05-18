import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){},
                ),
        
      ),

      body:Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top:20),
            child: const Center(
              child:Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    //backgroundImage: NetworkImage('https://example.com/image.jpg'),
                  ),

                  Padding(padding: EdgeInsets.only(top:10)),
                  Text("Monica Jenkins"),
                  Text("@monicsjen"),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(top:20,bottom:15),
            child:const Center(
              child: Row(
                children: [
                  Expanded(
                    child:Column(
                      children: [
                        Text("100"),
                        Text("Following"),
                      ],
                    ),
                  ),
                  Expanded(
                    child:Column(
                      children: [
                        Text("452"),
                        Text("Follower"),
                      ],
                    ),
                  ),

                  Expanded(
                    child:Column(
                      children: [
                        Text("1"),
                        Text("Recipe"),
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ),

          const Divider(
            color: Colors.green,
            thickness: 1,
            height: 10,
          ),

          const Padding(padding: EdgeInsets.only(top:15)),

          Container(
           padding: const EdgeInsets.only(top:20),
           height: 420,
           width: 350,
            
            decoration: BoxDecoration(
             color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
             ),
            child:Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                    """
      Day 01:Nasi Goreng Sardin
      Cara masak dia pun simple and cost-friendly,
      Cara masak:
      1. Kisar bawang besar dan bawang putih.
          Panaskan minyak.Tumis bahan kisar dan 
          cili api sampai garing.
     2.  Masukkan sardin, pes asam jawa 
          dan kicap manis,
     3. Masukkan nasi kacau sampai sebati 
                    """,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'See more ...',
                        style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                      },
                      child: const Text(
                        'See Ingredient',
                        style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.only(top:10)),

                Container(
                  
                  //color:Colors.green,
                  height: 160,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  
                ),

                Container(
                  padding: const EdgeInsets.only(left:30,top:10),
                  child:const Row(
                    children: [
                      Expanded(
                        child:Row(
                          children: [
                            Icon(Icons.favorite),
                            Text("326"),
                          ],
                        ),
                        
                      ),

                      Expanded(
                        child:Row(
                          children: [
                            Icon(Icons.comment),
                            Text("326"),
                          ],
                        ),
                        
                      ),

                      Expanded(
                        child:Row(
                          children: [
                            Icon(Icons.upload),
                            Text("326"),
                          ],
                        ),
                        
                      ),
                      
                    ],
                  ),
                )

                
              ],
            ),

          ),
          
        ],

        
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