import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/homepage.dart';
import 'package:sign_in_button/sign_in_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      appBar: AppBar(
        title: Text('RenalCare'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to RenalCare'),
            if (_user == null) ...[
              Text('You are not signed in'),
              googlesignin_btn(),
            ] else ...[
              Text('You are signed in'),
              Text(_user!.displayName ?? ''),
              Text(_user!.email ?? ''),
              Text(_user!.phoneNumber ?? ''),
              if (_user != null && _user!.photoURL != null) ...[
                CircleAvatar(
                  backgroundImage: NetworkImage(_user!.photoURL!),
                  radius: 50,
                ),
              ],
              // print user

              ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text('Sign out'),
              ),
            ],
          ],
        ),
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
      _auth.signInWithProvider(googleProvider);
      Get.to(homePage());
    } catch (e) {
      print(e);
    }
  }
}
