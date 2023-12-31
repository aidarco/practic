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
    apiKey: 'AIzaSyBess9REOumGUIMrHU5o60ImDGAy-iojZc',
    appId: '1:598184921082:web:55af207aff32dcbee0c643',
    messagingSenderId: '598184921082',
    projectId: 'practic-509bb',
    authDomain: 'practic-509bb.firebaseapp.com',
    storageBucket: 'practic-509bb.appspot.com',
    measurementId: 'G-SC4FVEHWR0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoE4gwMe8ojYWAAHqjgLlxJH8-E_rG7js',
    appId: '1:598184921082:android:c2d92327a97a3eaae0c643',
    messagingSenderId: '598184921082',
    projectId: 'practic-509bb',
    storageBucket: 'practic-509bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3y4lKheEPjAvQKFoTUKo0GIZB1IPo8QA',
    appId: '1:598184921082:ios:5e08fc7620849284e0c643',
    messagingSenderId: '598184921082',
    projectId: 'practic-509bb',
    storageBucket: 'practic-509bb.appspot.com',
    iosBundleId: 'com.example.practic',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3y4lKheEPjAvQKFoTUKo0GIZB1IPo8QA',
    appId: '1:598184921082:ios:f1ff6d10a6f1f4b0e0c643',
    messagingSenderId: '598184921082',
    projectId: 'practic-509bb',
    storageBucket: 'practic-509bb.appspot.com',
    iosBundleId: 'com.example.practic.RunnerTests',
  );
}
