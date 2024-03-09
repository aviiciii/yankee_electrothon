import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Onboarding6 extends StatelessWidget {
  const Onboarding6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Do you do Dialysis?',
              style: TextStyle(fontSize: 30),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: null,
                      onChanged: (value) {},
                    ),
                    Text('Yes'),
                  ],
                ),
                SizedBox(width: 16), // Add some spacing between the columns
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: null,
                      onChanged: (value) {},
                    ),
                    Text('No'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
