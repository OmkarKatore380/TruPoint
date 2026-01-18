import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trupoint/app.dart';
import 'package:trupoint/config/env.dart';
import 'package:trupoint/firebase_options.dart';

void main() async {
  debugPrint("Starting App Initialization...");
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("Widgets Binding Initialized");

  // Initialize Environment Variables
  try {
    debugPrint("Initializing Environment...");
    await initEnvironment();
    debugPrint("Environment Initialized");
  } catch (e) {
    debugPrint("Warning: .env file not found or failed to load: $e");
  }

  // Initialize Firebase
  try {
    debugPrint("Initializing Firebase...");
    await Firebase.initializeApp(
      options: firebaseOptions,
    );
    debugPrint("Firebase Initialized Successfully");
  } catch (e) {
    debugPrint("Firebase Initialization Error: $e");
  }

  debugPrint("Running App...");
  runApp(const TruPointApp());
}
