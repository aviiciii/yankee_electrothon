import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:renalcare/pages/graph/graph.dart';

import 'package:renalcare/pages/login/1.dart';
import 'package:renalcare/pages/login/google_sign_in.dart';
import 'package:renalcare/pages/splashscreen/1.dart';

import 'firebase_options.dart';
import 'package:get/get.dart';
import 'pages/graph/bar_chart.dart';

// pages

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
      home: splashScreen(),
    );
  }
}