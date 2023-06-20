import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int rating = 0;
  String comment = '';
  List<PlatformFile> attachments = [];
  String imagePath = 'assets/images/imageex2.png';

  void setRating(int value) {
    setState(() {
      rating = value;
    });
  }

  void setComment(String value) {
    setState(() {
      comment = value;
    });
  }

  void submitReview() {          // checks whether user select a rating and handles submitting data to Firebase database
    if (rating == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select a rating before submitting.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Simulating saving the data to a database purpose
      print('Rating: $rating');
      print('Comment: $comment');
      print('Attachments:');
      for (var attachment in attachments) {
        print(' - ${attachment.name}');
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Review submitted successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> uploadAttachment() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        attachments.addAll(result.files);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Page'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                imagePath,
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Rate the recipe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.star),
                  color: rating >= 1 ? Colors.yellow : Colors.grey,
                  onPressed: () {
                    setRating(1);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  color: rating >= 2 ? Colors.yellow : Colors.grey,
                  onPressed: () {
                    setRating(2);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  color: rating >= 3 ? Colors.yellow : Colors.grey,
                  onPressed: () {
                    setRating(3);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  color: rating >= 4 ? Colors.yellow : Colors.grey,
                  onPressed: () {
                    setRating(4);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.star),
                  color: rating >= 5 ? Colors.yellow : Colors.grey,
                  onPressed: () {
                    setRating(5);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Leave a comment:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 3,
              onChanged: (value) {
                setComment(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Attachments:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (attachments.isEmpty)
              Text('No attachments')
            else
              Column(
                children: attachments
                    .map((attachment) => Text(attachment.name))
                    .toList(),
              ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text(
                'Upload Attachment',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                uploadAttachment();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                submitReview();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReviewPage(),
  ));
}










