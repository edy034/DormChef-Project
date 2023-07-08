import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/screens/issueReport/issueRep.dart';
import 'package:flutter/material.dart';


class ViewReport extends StatelessWidget {
  const ViewReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Issue Reports',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const IssueRep(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: MyTable(),
        ),
      ),
    );
  }
}

class MyTable extends StatefulWidget {
  const MyTable({Key? key}) : super(key: key);

  @override
  State<MyTable> createState() => MyTableState();
}

class MyTableState extends State<MyTable> {
  List<Reports> reports = []; // List to store fetched data

  @override
  void initState() {
    super.initState();
    fetchReports(); // Call the method to fetch data from Firebase
  }

  void fetchReports() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('reports').get();
    final List<Reports> fetchedReports = snapshot.docs
        .map((doc) => Reports.fromJson(doc.data()))
        .toList();
    setState(() {
      reports = fetchedReports;
    });
  }

  void viewImage(String imageUrl) {
    // Implement your logic to view the image or file from Firebase Storage
    // You can navigate to a new screen or show a dialog to display the image or file
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Image.network(imageUrl),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        //shrinkWrap: true,
        children: [
          TableRow(
            children: [
              Container(padding: const EdgeInsets.all(10), child: const Text('Feedback')),
              Container(padding: const EdgeInsets.all(10), child: const Text('Date')),
              Container(padding: const EdgeInsets.all(10), child: const Text('File')),
              Container(padding: const EdgeInsets.all(10), child: const Text('Delete')),
            ],
          ),
          for (final report in reports)
            TableRow(
              children: [
                Container(padding: const EdgeInsets.all(10), child: Text(report.feedback)),
                Container(padding: const EdgeInsets.all(10), child: Text(report.date.toIso8601String())),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      viewImage(report.imageUrl!);
                    },
                    child: Icon(Icons.insert_drive_file),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    onPressed: () async {
                      print("Remove table row");
                      final doc = FirebaseFirestore.instance.collection('reports').doc(report.id);
                      await doc.delete();
                      setState(() {
                        reports.remove(report);
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class Reports {
  String id;
  final String feedback;
  final DateTime date;
  final String? imageUrl;

  Reports({
    this.id = '',
    required this.feedback,
    required this.date,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'feedback': feedback,
        'date': date,
        'imageUrl': imageUrl,
      };

  static Reports fromJson(Map<String, dynamic> json) => Reports(
        id: json['id'],
        feedback: json['feedback'],
        date: (json['date'] as Timestamp).toDate(),
        imageUrl: json['imageUrl'],
      );
}

void main() {
  runApp(const MaterialApp(
    title: 'Issue Reports',
    home: ViewReport(),
  ));
}
