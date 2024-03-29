import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/homepage.dart';
import 'package:renalcare/pages/onboarding/1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_button/sign_in_button.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
        print(_user);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100), // Add a SizedBox with height 100
          const Image(
            image: AssetImage(
              'assets/logo.png',
            ),
          ), // Replace 'path_to
          const Text(
            "Let's get started!", // Add your desired text here
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold, // Add font weight here
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: googlesignin_btn(),
          ),
        ],
      ),
    );
  }

  Widget googlesignin_btn() {
    return Center(
        child: SizedBox(
            height: 50,
            width: 200,
            child: SignInButton(
              Buttons.google,
              text: "Sign in with Google",
              onPressed: _handleGoogleSignIn,
            )));
  }

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      await _auth.signInWithProvider(googleProvider);
      // save to shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("email", _user!.email.toString());
      print("Created: "+_user!.metadata.creationTime.toString());
      print("Last Sign In: "+_user!.metadata.lastSignInTime.toString());
      if (_user != null && _user!.metadata.creationTime != null && _user!.metadata.lastSignInTime != null) {
        if (_user!.metadata.creationTime!.difference(_user!.metadata.lastSignInTime!).inMinutes < 2) {
          // Add your code here
          Get.to(OnboardingUserDetail1());
        } 
      }
      else {
        Get.to(homePage());
      }
      


    } catch (e) {
      print(e);
    }
  }
}
