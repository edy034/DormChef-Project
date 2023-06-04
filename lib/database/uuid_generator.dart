import 'package:uuid/uuid.dart';

class UuidGenerator {
  static String generateUuid() {
    return const Uuid().v4();
  }
}