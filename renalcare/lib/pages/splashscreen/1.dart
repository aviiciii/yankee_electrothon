import 'package:flutter/material.dart';
import 'package:renalcare/pages/homepage.dart';
import 'package:renalcare/pages/splashscreen/2.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail = ""; 

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>  {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      await Future.delayed(Duration(milliseconds: 3000), () {});
      // check if email is null
      if (finalEmail == "") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashScreen2()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homePage()));
      }
    
    });
    super.initState();
    _navigateToHome();

  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashScreen2()));
  }
  Future  getValidationData() async {
    final prefs = await SharedPreferences.getInstance();
    var email =  prefs.getString("email");
    setState(() {
      finalEmail = email!;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  'assets/logo.png',
                ),
              ),
              Text(
                "RenalCare",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }



    
    




}
