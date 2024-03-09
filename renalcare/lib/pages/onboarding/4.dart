import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renalcare/pages/onboarding/5.dart';
import 'package:renalcare/pages/onboarding/6.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnboardingUserDetail4 extends StatefulWidget {
  final int? selectedDiabetesOption; // Corrected parameter name

  const OnboardingUserDetail4({Key? key, this.selectedDiabetesOption}) : super(key: key);

  @override
  _OnboardingUserDetail4State createState() => _OnboardingUserDetail4State();
}

class _OnboardingUserDetail4State extends State<OnboardingUserDetail4> {
  int? selectedOption; // Track the selected option, null means no selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Do you have Diabetes?',
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
                      ? () {
                          // Store user data in Firestore
                          _storeUserData(selectedOption!);
                          // Navigate to the homepage
                          Get.to(OnboardingUserDetail5());
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

  // Function to store user data in Firestore
  void _storeUserData(int selectedOption) async {
  try {
      User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Check if the document already exists for the user
      final userDoc = FirebaseFirestore.instance.collection('UserDetails');
       await userDoc.doc(user.uid).update({
          'isDiabetic': selectedOption == 1,
        });
        print('User data stored successfully.');
      }
      
     else {
      print('User is not signed in.');
     }
  } catch (e) {
    print('Error storing user data: $e');
  }
}
}