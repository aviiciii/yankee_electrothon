import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/onboarding/3.dart';

class OnboardingUserDetail2 extends StatelessWidget {
  const OnboardingUserDetail2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Are you on \n Dialysis?',
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
                    'YES',
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
                    'NO',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(OnboardingUserDetail3());
                  },
                  child: Icon(Icons.arrow_forward_outlined),
                ),
                SizedBox(width: 40)
              ],
            )
            // Add more checklist items as needed
          ],
        ),
      ),
    );
  }
}
