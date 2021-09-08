import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hobby_collections/loginScreen.dart';


import 'home.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp( new MaterialApp(
    home: LoginScreen(),
  ));
}

