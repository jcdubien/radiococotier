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
    apiKey: 'AIzaSyARu5Mf31TLNbyWcuPjbFS-ZOOU1i3AOiU',
    appId: '1:498122094051:web:088387f40db65af5295cd6',
    messagingSenderId: '498122094051',
    projectId: 'radio-cocotier',
    authDomain: 'radio-cocotier.firebaseapp.com',
    storageBucket: 'radio-cocotier.appspot.com',
    measurementId: 'G-4Q1TBKJH0W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl74i_oe8FDQGpRrX4208s_NFaiV0D3aA',
    appId: '1:498122094051:android:cb94bdf76b6345fa295cd6',
    messagingSenderId: '498122094051',
    projectId: 'radio-cocotier',
    storageBucket: 'radio-cocotier.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0aiLH2rFmBaS4DhtpKihoFgEMOb7Qtes',
    appId: '1:498122094051:ios:8bf859a5ae589fdb295cd6',
    messagingSenderId: '498122094051',
    projectId: 'radio-cocotier',
    storageBucket: 'radio-cocotier.appspot.com',
    iosClientId: '498122094051-nak168jhvqqttoati02lbl9iiboum8v3.apps.googleusercontent.com',
    iosBundleId: 'com.digitaliscaraibes.radiococotierapp',
  );
}
