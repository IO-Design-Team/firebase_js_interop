import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fji_example/firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final messaging = FirebaseMessaging.instance;

  await auth.useAuthEmulator('localhost', 9099);
  firestore.useFirestoreEmulator('localhost', 8080);

  // This will call the cloud function that creates the user document
  await auth.signInAnonymously();

  await messaging.requestPermission();

  //! NOTE: THIS IS NOT PRODUCTION READY
  final token = await messaging.getToken();
  if (token != null) {
    
  }
}
