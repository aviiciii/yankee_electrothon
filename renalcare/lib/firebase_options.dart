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
    apiKey: 'AIzaSyAoIZqez36VOdzJfYKv3ciKaBmGBLXCdKo',
    appId: '1:389383541718:web:01122ab193c7810d0fca77',
    messagingSenderId: '389383541718',
    projectId: 'renalcare-fd7f5',
    authDomain: 'renalcare-fd7f5.firebaseapp.com',
    databaseURL: 'https://renalcare-fd7f5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'renalcare-fd7f5.appspot.com',
    measurementId: 'G-DYXR4YG0ZK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6KE2L_RQAkQhuwpDE_9ZWvCLtbUinsAg',
    appId: '1:389383541718:android:246046d3a48b78f60fca77',
    messagingSenderId: '389383541718',
    projectId: 'renalcare-fd7f5',
    databaseURL: 'https://renalcare-fd7f5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'renalcare-fd7f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWK47oOJ5Bn2TPz6D2qCenO7nLgih3uEU',
    appId: '1:389383541718:ios:13e1bddb316c82c30fca77',
    messagingSenderId: '389383541718',
    projectId: 'renalcare-fd7f5',
    databaseURL: 'https://renalcare-fd7f5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'renalcare-fd7f5.appspot.com',
    androidClientId: '389383541718-2dcnsnq2me932ebncqs07ckjad52inis.apps.googleusercontent.com',
    iosClientId: '389383541718-bum9baitf4bmcbdg3rtcr8phvuc9dn7j.apps.googleusercontent.com',
    iosBundleId: 'com.example.renalcare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWK47oOJ5Bn2TPz6D2qCenO7nLgih3uEU',
    appId: '1:389383541718:ios:f1c5dd05635c950f0fca77',
    messagingSenderId: '389383541718',
    projectId: 'renalcare-fd7f5',
    databaseURL: 'https://renalcare-fd7f5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'renalcare-fd7f5.appspot.com',
    androidClientId: '389383541718-2dcnsnq2me932ebncqs07ckjad52inis.apps.googleusercontent.com',
    iosClientId: '389383541718-vkkebpp2rln9kutfsp8ftgv8lh4rr13c.apps.googleusercontent.com',
    iosBundleId: 'com.example.renalcare.RunnerTests',
  );
}