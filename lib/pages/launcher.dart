import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: WelcomeScreen(),
  ));
}
