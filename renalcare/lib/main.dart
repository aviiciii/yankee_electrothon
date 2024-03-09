import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:renalcare/pages/addfood.dart';
import 'package:renalcare/pages/food.dart';
import 'package:renalcare/pages/homepage.dart';
import 'package:renalcare/pages/onboarding/1.dart';
import 'package:renalcare/pages/onboarding/5.dart';
import 'package:renalcare/pages/onboarding/6.dart';
import 'package:renalcare/pages/sidebar/1.dart';
import 'package:renalcare/pages/sidebar/2.dart';
import 'package:renalcare/test2.dart';

import 'firebase_options.dart';

// shared dependencies
import 'package:shared_preferences/shared_preferences.dart';

// getx
import 'package:get/get.dart';

// pages
import 'package:renalcare/pages/splashscreen/1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RenalCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: personalInfo(), // Replace this line with the correct function call or define the function
    );
  }
}
