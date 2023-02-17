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
    apiKey: 'AIzaSyCE8MJdVYa1ZA2hV9C5wt-iv031KxyAtyU',
    appId: '1:737152291235:web:8a71c35ddefc6cf5e24a16',
    messagingSenderId: '737152291235',
    projectId: 'curdoperationflutter',
    authDomain: 'curdoperationflutter.firebaseapp.com',
    storageBucket: 'curdoperationflutter.appspot.com',
    measurementId: 'G-MH2JV5G9HF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGkFEMKSFeHtEE3UWzqsVsm72t1Haekl8',
    appId: '1:737152291235:android:cefb3c342ebe56e9e24a16',
    messagingSenderId: '737152291235',
    projectId: 'curdoperationflutter',
    storageBucket: 'curdoperationflutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARcA9bJDBT4HZfznUHuPT_KxnDbPS-Qyk',
    appId: '1:737152291235:ios:1114bdbb256ab597e24a16',
    messagingSenderId: '737152291235',
    projectId: 'curdoperationflutter',
    storageBucket: 'curdoperationflutter.appspot.com',
    iosClientId: '737152291235-8lsk23rl7ri6mov2u21qcdk27js6ihf9.apps.googleusercontent.com',
    iosBundleId: 'com.example.curdOperation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARcA9bJDBT4HZfznUHuPT_KxnDbPS-Qyk',
    appId: '1:737152291235:ios:1114bdbb256ab597e24a16',
    messagingSenderId: '737152291235',
    projectId: 'curdoperationflutter',
    storageBucket: 'curdoperationflutter.appspot.com',
    iosClientId: '737152291235-8lsk23rl7ri6mov2u21qcdk27js6ihf9.apps.googleusercontent.com',
    iosBundleId: 'com.example.curdOperation',
  );
}
