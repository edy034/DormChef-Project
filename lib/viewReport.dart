import 'package:flutter/material.dart';
import 'package:dormchef/subForm.dart';


class ViewReport extends StatelessWidget {
  const ViewReport({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Padding(padding: EdgeInsets.only(top:40)),
          const Text(
            "     Dormchef issue report",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              
            ),
          ),

      
      
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top:80)),
            Container(
              padding: const EdgeInsets.all(10),
              child: Table(
              border: TableBorder.all(),
                children: [
                  TableRow(
                  children: [
                    TableCell(
                      child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.grey,
                      child: Text('UserID'),
                      ),
                    ),

                     TableCell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey,
                    child: Text('Description'),
                  ),
                ),
                 TableCell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey,
                    child: Text('attachment'),
                  ),
                ),
                
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey,
                    child: Text(''),
                  ),
                ),

             ],
              ),

                  TableRow(
                  children: [
                    TableCell(
                      child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.grey,
                      child: Text('Cell 1'),
                      ),
                    ),

                     TableCell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey,
                    child: Text('Cell 2'),
                  ),
                ),
                 TableCell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey,
                    child: Text('Cell 3'),
                  ),
                ),
                
                TableCell(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.grey,
                    child: Icon(Icons.delete),
                  ),
                ),
              ],
              ),
          ],
        ),
      ),
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
                label: 'Pending',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
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
