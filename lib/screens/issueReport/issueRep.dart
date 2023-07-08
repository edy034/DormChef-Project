import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dormchef/screens/issueReport/viewReport.dart';
import 'package:dormchef/screens/user_profile/profile_page/profile_main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class IssueRep extends StatefulWidget {
  const IssueRep({Key? key}) : super(key: key);

  @override
  _IssueRepState createState() => _IssueRepState();
}

class _IssueRepState extends State<IssueRep> {
  final controller = TextEditingController();
  String? selectedFileName;
  String? uploadedFileUrl;
  String? fileStoragePath; // Added variable to store the Firebase Storage path of the file

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            const Text("     Quick Access"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
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
            const Padding(padding: EdgeInsets.only(top: 30)),
            const Text(
              "    Tell us your feedback",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("    For extra safety, do not provide personal information"),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: TextField(
                controller: controller,
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
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text("    Attachment (.JPEG/.JPG/.PNG only)"),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Row(
                children: [
                  const SizedBox(height: 32),
                  ElevatedButton(
                    child: const Text('Upload File'),
                    onPressed: () async {
                      final result = await FilePicker.platform.pickFiles();

                      if (result == null) return;

                      final file = result.files.first;
                      openFile(file);

                      setState(() {
                        selectedFileName = file.name;
                      });

                      final newFile = await saveFilePermanently(file);
                      final downloadURL = await FirebaseApi.uploadFile('files/${file.name}', newFile);

                      if (downloadURL != null) {
                        setState(() {
                          uploadedFileUrl = downloadURL;
                          fileStoragePath = 'files/${file.name}';
                        });
                      }

                      print('from path: ${file.path!}');
                      print('to new path: ${newFile.path!}');
                    },
                  ),
                ],
              ),
            ),
            if (selectedFileName != null)
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.file_copy),
                    const SizedBox(width: 5),
                    Text(selectedFileName!),
                    const SizedBox(width: 5),
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () async {
                        setState(() {
                          selectedFileName = null;
                          uploadedFileUrl = null;
                          fileStoragePath = null;
                        });

                        // Remove the file from Firebase Storage
                        if (fileStoragePath != null) {
                          await FirebaseApi.deleteFile(fileStoragePath!);
                        }
                      },
                    ),
                  ],
                ),
              ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                width: 300,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    final feedback = controller.text;
                    createFeedback(feedback: feedback, imageUrl: uploadedFileUrl);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ViewReport(),
                      ),
                    );
                  },
                  child: const Text('Submit Report'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future createFeedback({required String feedback, String? imageUrl}) async {
    final feedoc = FirebaseFirestore.instance.collection('reports').doc();

    final reports = Reports(
      id: feedoc.id,
      feedback: feedback,
      imageUrl: imageUrl,
      date: DateTime(2001, 6, 21),
    );

    final json = reports.toJson();

    await feedoc.set(json);
  }
}

class Reports {
  String id;
  final String feedback;
  final String? imageUrl;
  final DateTime date;

  Reports({
    this.id = '',
    required this.feedback,
    this.imageUrl,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'feedback': feedback,
        'imageUrl': imageUrl,
        'date': date,
      };
}

class FirebaseApi {
  static Future<String?> uploadFile(String destination, File file) async {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  static Future<void> deleteFile(String fileStoragePath) async {
    try {
      final ref = FirebaseStorage.instance.ref(fileStoragePath);
      await ref.delete();
      print("done delete");
    } catch (e) {
      print('Error deleting file: $e');
    }
  }
}


