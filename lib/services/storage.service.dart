import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static String location = 'gs://dormchef-cc34d.appspot.com/';
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future<String?> uploadImage(String uid, String imagePath) async {
    try {
      Reference ref = storage.ref().child('users/$uid/profile.jpg');
      await ref.putFile(imagePath as File);
      String url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }

  static Future<String?> deleteImage(String uid) async {
    try {
      Reference ref = storage.ref().child('users/$uid/profile.jpg');
      await ref.delete();
      return 'Delete successful';
    } catch (e) {
      return null;
    }
  }

  static Future<String?> readImage(String path) async {
    try {
      Reference ref = storage.ref().child(path);
      String url = await ref.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      return null;
    }
  }
}
