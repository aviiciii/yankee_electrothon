import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renalcare/pages/login/1.dart';
import 'package:renalcare/pages/splashscreen/1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
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
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: _user != null ? Text(_user!.displayName ?? '') : Text("Gopal"),
          accountEmail: _user != null ? Text(_user!.email ?? '') : Text("work panala da"),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                _user != null ? _user!.photoURL ?? '' : 'https://www.shutterstock.com/image-vector/face-palm-retro-vintage-disappointed-600nw-258823979.jpg')
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          leading: Icon(Icons.auto_graph),
          title: Text("Learn CKD"),
          onTap: () => {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () => {},
        ),
        ListTile(
          leading: Icon(Icons.question_mark),
          title: Text("Help & faq\'s"),
          onTap: () => {},
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Personal Info"),
          onTap: () => {},
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text("Logout"),
          onTap: () async {
            await _auth.signOut();

            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString("email", "");

            Get.to(splashScreen());
          },
        ),
      ],
    ));
  }
}
