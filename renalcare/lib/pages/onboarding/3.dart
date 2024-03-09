import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renalcare/pages/onboarding/4.dart';
import 'package:shared_preferences/shared_preferences.dart';

// OnboardingUserDetail3

class OnboardingUserDetail3 extends StatefulWidget {
  final int? selectedDialysisOption; // Corrected parameter name

  const OnboardingUserDetail3({Key? key, this.selectedDialysisOption}) : super(key: key);

  @override
  _OnboardingUserDetail3State createState() => _OnboardingUserDetail3State();
}

class _OnboardingUserDetail3State extends State<OnboardingUserDetail3> {
  int? selectedOption; // Track the selected option, null means no selection

  final CollectionReference userDetailsCollection =
      FirebaseFirestore.instance.collection('UserDetails');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Do you have High Blood Pressure?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
                      ? () async {
                          User? user = FirebaseAuth.instance.currentUser;

                          if (user != null) {
                            await userDetailsCollection.doc(user.uid).update({
                              'hasHighBloodPressure': selectedOption == 1,
                            });
                          } else {
                            print('User is not signed in.');
                          }
                          Get.to(OnboardingUserDetail4());
                        }
                      : null,
                  child: Icon(Icons.arrow_forward_outlined),
                ),
                SizedBox(width: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

