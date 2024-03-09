import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/onboarding/3.dart';

class OnboardingUserDetail2 extends StatefulWidget {
  final int? selectedDialysisOption; // Corrected parameter name

  const OnboardingUserDetail2(int i, {Key? key, this.selectedDialysisOption}) : super(key: key);

  @override
  _OnboardingUserDetail2State createState() => _OnboardingUserDetail2State();
}

class _OnboardingUserDetail2State extends State<OnboardingUserDetail2> {
  int? selectedOption; // Track the selected option, null means no selection

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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<int>(
                      value: 1, // Value for "YES"
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<int>(
                      value: 2, // Value for "NO"
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value;
                        });
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
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: selectedOption != null
                      ? () {
                          Get.to(OnboardingUserDetail3(
                            selectedDialysisOption: selectedOption, // Pass the selected option
                          ));
                        }
                      : null,
                  child: Icon(Icons.arrow_forward_outlined),
                ),
                SizedBox(width: 40)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
