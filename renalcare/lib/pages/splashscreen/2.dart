import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:renalcare/pages/graph/bar_chart.dart';
import 'package:renalcare/pages/graph/graph.dart';
import 'package:renalcare/pages/splashscreen/1.dart';
import 'package:renalcare/pages/splashscreen/2.dart';
import 'package:renalcare/pages/splashscreen/3.dart';

class SplashScreen2 extends StatelessWidget {
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
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //Text Welcome to
                const Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 30),
                ),
                //text RenalCare

                const Text(
                  'Renal Care',
                  style: TextStyle(fontSize: 40),
                ),
                //Description
                const Padding(
                  padding: EdgeInsets.only(
                      top: 30.0, bottom: 30, left: 30, right: 40),
                  child: Text(
                      "\“Your personalised Dietary Plan App for Kidney Patients\”  ",
                      style: TextStyle(fontSize: 20)),
                ),

                //row for buttons

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Get.to(OnbardingUserDetail1());
                      },
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
                        Get.to(splashScreen3());
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
        ],
      ),
    );
  }
}
