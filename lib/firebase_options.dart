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
    apiKey: 'AIzaSyB8bI8dUStAAj4VY-_2PngLpWyV_oYl_bI',
    appId: '1:730253427437:web:1a3c7b2658f371521d42e4',
    messagingSenderId: '730253427437',
    projectId: 'dodohan-6c8fd',
    authDomain: 'dodohan-6c8fd.firebaseapp.com',
    storageBucket: 'dodohan-6c8fd.appspot.com',
    measurementId: 'G-GCL3VFBWEL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsk1e_j8H_oxQdfQnroGX3mgf9mPc4IEo',
    appId: '1:730253427437:android:7e7f2ff928fd25ea1d42e4',
    messagingSenderId: '730253427437',
    projectId: 'dodohan-6c8fd',
    storageBucket: 'dodohan-6c8fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMqNGypATPiiG8Iqor3-N3KINabjHIL48',
    appId: '1:730253427437:ios:e0613b6cfe9ec8c11d42e4',
    messagingSenderId: '730253427437',
    projectId: 'dodohan-6c8fd',
    storageBucket: 'dodohan-6c8fd.appspot.com',
    iosClientId: '730253427437-2h6sjapt44cpj1i65hnestjlqfc0gvq2.apps.googleusercontent.com',
    iosBundleId: 'com.dodohan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMqNGypATPiiG8Iqor3-N3KINabjHIL48',
    appId: '1:730253427437:ios:3c7c24a388e494da1d42e4',
    messagingSenderId: '730253427437',
    projectId: 'dodohan-6c8fd',
    storageBucket: 'dodohan-6c8fd.appspot.com',
    iosClientId: '730253427437-8b9f0jjfumdmcn6i8orcem3idictebps.apps.googleusercontent.com',
    iosBundleId: 'com.dodohan',
  );
}
