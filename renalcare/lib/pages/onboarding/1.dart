import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:renalcare/pages/onboarding/2.dart';
import 'package:renalcare/widgets/nextbutton.dart';

class OnboardingUserDetail1 extends StatelessWidget {
  const OnboardingUserDetail1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'What stage is your \n Kidney Disease?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Add your logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Add your logic here
                    },
                  ),
                  const Text(
                    'CDK STAGE 1',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Add your logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Add your logic here
                    },
                  ),
                  const Text(
                    'CDK STAGE 2',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Add your logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Add your logic here
                    },
                  ),
                  const Text(
                    'CDK STAGE 3',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {
                // Add your logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Add your logic here
                    },
                  ),
                  const Text(
                    'CDK STAGE 4',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {
                // Add your logic here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Add your logic here
                    },
                  ),
                  const Text(
                    'CDK STAGE 5',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(OnboardingUserDetail2());
                  },
                  child: Icon(Icons.arrow_forward_outlined),
                ),
                SizedBox(width: 40)
              ],
            ), // Add more checklist items as needed
          ],
        ),
      ),
    );
  }
}
