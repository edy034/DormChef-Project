import 'dart:math';

String generateUid() {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  const uidLength = 10;
  
  String uid = '';
  for (int i = 0; i < uidLength; i++) {
    uid += chars[random.nextInt(chars.length)];
  }
  
  return uid;
}
