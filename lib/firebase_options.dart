import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

// --- CONFIGURATION ---
const String firebaseApiKey = 'AIzaSyBPXZaTv9FF7zXCWabAYkKXPxJy9mgy5sw';
const String firebaseProjectId = 'trupoint-6ca45';
const String firebaseMessagingSenderId = '531364711784';

const String webAppId = '1:531364711784:web:129caa0af8491383fd9add';
const String androidAppId = '1:531364711784:android:93fea5671a978643fd9add';
const String iosAppId = '1:531364711784:ios:your_ios_hash';
// ---------------------

FirebaseOptions get firebaseOptions {
  if (kIsWeb) {
    return web;
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return android;
    case TargetPlatform.iOS:
      return ios;
    case TargetPlatform.macOS:
      // Fallback to iOS or provide a specific macOS config if available
      return ios; 
    default:
      throw UnsupportedError(
        'DefaultFirebaseOptions are not supported for this platform ($defaultTargetPlatform). '
        'If you are running on Windows/Linux, Firebase is not yet supported via these options.'
      );
  }
}

const FirebaseOptions web = FirebaseOptions(
  apiKey: firebaseApiKey,
  appId: webAppId,
  messagingSenderId: firebaseMessagingSenderId,
  projectId: firebaseProjectId,
  authDomain: 'trupoint-6ca45.firebaseapp.com',
  storageBucket: 'trupoint-6ca45.firebasestorage.app',
  measurementId: 'G-HKEGPZDRC2',
);

const FirebaseOptions android = FirebaseOptions(
  apiKey: firebaseApiKey,
  appId: androidAppId,
  messagingSenderId: firebaseMessagingSenderId,
  projectId: firebaseProjectId,
  storageBucket: 'trupoint-6ca45.firebasestorage.app',
);

const FirebaseOptions ios = FirebaseOptions(
  apiKey: firebaseApiKey,
  appId: iosAppId,
  messagingSenderId: firebaseMessagingSenderId,
  projectId: firebaseProjectId,
  storageBucket: 'trupoint-6ca45.firebasestorage.app',
  iosBundleId: 'com.example.trupoint',
);
