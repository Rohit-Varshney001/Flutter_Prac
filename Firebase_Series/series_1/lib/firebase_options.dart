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
    apiKey: 'AIzaSyDlIbmLiubBU1csD0Mtd2PBQq9d4X49VKQ',
    appId: '1:318552107366:web:ee331ebc158cc4650d00a7',
    messagingSenderId: '318552107366',
    projectId: 'fir-series-d0cd6',
    authDomain: 'fir-series-d0cd6.firebaseapp.com',
    storageBucket: 'fir-series-d0cd6.appspot.com',
    measurementId: 'G-PNRGPR92S7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhUlKbQjubo5lhYcJEZTDto95lX9NMlPU',
    appId: '1:318552107366:android:4440f59088fd97e90d00a7',
    messagingSenderId: '318552107366',
    projectId: 'fir-series-d0cd6',
    storageBucket: 'fir-series-d0cd6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVx_Mr8d2wHlFkvFbXVNVVbUYV0C2f8Fo',
    appId: '1:318552107366:ios:56b7a866dc4e03bb0d00a7',
    messagingSenderId: '318552107366',
    projectId: 'fir-series-d0cd6',
    storageBucket: 'fir-series-d0cd6.appspot.com',
    iosBundleId: 'com.example.series1',
  );
}
