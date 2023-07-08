import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

// Need to refer yusri's code for this
class StorageService {
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
      return url;
    } catch (e) {
      return null;
    }
  }
}