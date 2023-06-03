import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TableLoader {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> loadTable() async {
    await Firebase.initializeApp();
    await createUserTable();
  }

  Future<void> createUserTable() async {
    final collectionSnapshot = await usersCollection.limit(1).get();
    if (collectionSnapshot.docs.isEmpty) {
      await usersCollection.doc().set({
      'username': 'admin',
      'email': 'adminIT@DormChef.com.my',
      'password':'admin2023',
      'bio': '',
      'phone': '',
      'subscription': '',
    });
    }
  }
}
