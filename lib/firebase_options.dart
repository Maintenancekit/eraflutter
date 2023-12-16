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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-bMRgFn2bdcHcSl6k3RHznIPW5qkwWhM',
    appId: '1:84399204863:android:9710b68a9d27f822759fca',
    messagingSenderId: '84399204863',
    projectId: 'emergency-road-assister',
    storageBucket: 'emergency-road-assister.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiy7TOjq0V9wRv980gaho8x-jna5fa0hQ',
    appId: '1:84399204863:ios:5c7d825280b85581759fca',
    messagingSenderId: '84399204863',
    projectId: 'emergency-road-assister',
    storageBucket: 'emergency-road-assister.appspot.com',
    iosBundleId: 'com.romario.eidea.emergencyidea',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiy7TOjq0V9wRv980gaho8x-jna5fa0hQ',
    appId: '1:84399204863:ios:025440a59fb155d4759fca',
    messagingSenderId: '84399204863',
    projectId: 'emergency-road-assister',
    storageBucket: 'emergency-road-assister.appspot.com',
    iosBundleId: 'com.romario.eidea.emergencyidea.RunnerTests',
  );
}
