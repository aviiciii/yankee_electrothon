import 'package:flutter/material.dart';

// firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:renalcare/pages/homepage.dart';
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
  

  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  
  @override
  Widget build(BuildContext context) {

    var loggedIn;
    get_pref().then((value) => loggedIn);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RenalCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loggedIn == true ? const homePage () : const splashScreen(),
    );
  }

  Future<bool> get_pref() async{
    final prefs = await SharedPreferences.getInstance();
    var email = await prefs.getString("email");
    print(email);
    if (email == null) {
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }
}



