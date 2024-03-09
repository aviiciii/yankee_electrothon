import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/login/1.dart';
import 'package:renalcare/pages/onboarding/1.dart';

class splashScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset('assets/logo.png')),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
                // bottomLeft: Radius.circular(.0),
                // bottomRight: Radius.circular(40.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const Text("Features",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)),
                  const SizedBox(height: 50,),
              
                  //features points
                  Text('• Personalized diet plans for CKD levels'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('• Progress tracking charts'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('• Community forum for support'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('• Weekly food recipes'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('• Customizable recipes based on user preferences '),
                  SizedBox(
                    height: 50,
                  ),
                  
                  
              
                  //Row of button
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Skip'),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(const login());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Next'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
