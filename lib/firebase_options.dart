// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCTX_WWL4fdLPaLJ78kFLoK9EtEYbeV7tg',
    appId: '1:13541065091:web:6f70ed2f925f5da66eb6b6',
    messagingSenderId: '13541065091',
    projectId: 'dormchef-cc34d',
    authDomain: 'dormchef-cc34d.firebaseapp.com',
    storageBucket: 'dormchef-cc34d.appspot.com',
    measurementId: 'G-H374ZE62E2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjnJA4cqhHRGaZciWoPrdCtvYAhSn2WQ4',
    appId: '1:13541065091:android:6cb83e04866e36316eb6b6',
    messagingSenderId: '13541065091',
    projectId: 'dormchef-cc34d',
    storageBucket: 'dormchef-cc34d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkJbvRcaoTfbFM-CcCz0YLWjMC0_sIdZQ',
    appId: '1:13541065091:ios:2c7c543604089d746eb6b6',
    messagingSenderId: '13541065091',
    projectId: 'dormchef-cc34d',
    storageBucket: 'dormchef-cc34d.appspot.com',
    iosClientId: '13541065091-n2o7blobjgacf6jndms4qnpc0cc3gv54.apps.googleusercontent.com',
    iosBundleId: 'com.example.dormchef',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkJbvRcaoTfbFM-CcCz0YLWjMC0_sIdZQ',
    appId: '1:13541065091:ios:2c7c543604089d746eb6b6',
    messagingSenderId: '13541065091',
    projectId: 'dormchef-cc34d',
    storageBucket: 'dormchef-cc34d.appspot.com',
    iosClientId: '13541065091-n2o7blobjgacf6jndms4qnpc0cc3gv54.apps.googleusercontent.com',
    iosBundleId: 'com.example.dormchef',
  );
}