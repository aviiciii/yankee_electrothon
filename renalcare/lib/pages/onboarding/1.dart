import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/onboarding/2.dart';
import 'package:renalcare/widgets/nextbutton.dart';

class OnboardingUserDetail1 extends StatefulWidget {
  const OnboardingUserDetail1({Key? key}) : super(key: key);

  @override
  _OnboardingUserDetail1State createState() => _OnboardingUserDetail1State();
}

class _OnboardingUserDetail1State extends State<OnboardingUserDetail1> {
  int selectedStage = -1; // Track the selected stage, -1 means no selection

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
            for (int i = 1; i <= 5; i++)
              RadioListTile<int>(
                title: Text('CDK STAGE $i'),
                value: i,
                groupValue: selectedStage,
                onChanged: (value) {
                  setState(() {
                    selectedStage = value!;
                  });
                },
              ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: selectedStage != -1
                      ? () {
                          Get.to(OnboardingUserDetail2());
                        }
                      : null, // Disable the button if no stage is selected
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
