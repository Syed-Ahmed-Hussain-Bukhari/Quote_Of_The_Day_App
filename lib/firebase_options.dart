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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA_Oh13whsSEslm2ldg2MMRJ8S8NRKYY90',
    appId: '1:198773722648:web:4c4289a0af7ff3eb4f3d6d',
    messagingSenderId: '198773722648',
    projectId: 'quote-app-181e6',
    authDomain: 'quote-app-181e6.firebaseapp.com',
    storageBucket: 'quote-app-181e6.appspot.com',
    measurementId: 'G-FQ8YPH3DFP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCh0RW1bEwc_0NA81ac_0YXY3EJMeQmFKI',
    appId: '1:198773722648:android:b30c747e15abb0254f3d6d',
    messagingSenderId: '198773722648',
    projectId: 'quote-app-181e6',
    storageBucket: 'quote-app-181e6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLEXEzpaPPAtanvvLSsaYlYSDfTTkVI80',
    appId: '1:198773722648:ios:6b13233ccd1f28164f3d6d',
    messagingSenderId: '198773722648',
    projectId: 'quote-app-181e6',
    storageBucket: 'quote-app-181e6.appspot.com',
    iosBundleId: 'com.example.quoteApp',
  );
}
