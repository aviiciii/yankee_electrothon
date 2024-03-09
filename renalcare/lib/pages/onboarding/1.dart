import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renalcare/pages/onboarding/2.dart';


class OnboardingUserDetail1 extends StatefulWidget {
  const OnboardingUserDetail1({Key? key}) : super(key: key);

  @override
  _OnboardingUserDetail1State createState() => _OnboardingUserDetail1State();
}

class _OnboardingUserDetail1State extends State<OnboardingUserDetail1> {
  int? selectedCkdLevel;
  final CollectionReference userDetailsCollection =
      FirebaseFirestore.instance.collection('UserDetails');

  @override
  Widget build(BuildContext context) {
    List<int> ckdLevels = [1, 2, 3, 4, 5]; // CKD levels from 1 to 5

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select your CKD Level:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: ckdLevels.map((level) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<int>(
                      value: level, // Value corresponds to the CKD level
                      groupValue: selectedCkdLevel,
                      onChanged: (value) {
                        setState(() {
                          selectedCkdLevel = value; // Update the selected CKD level
                        });
                      },
                    ),
                    Text(
                      'Level $level',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: selectedCkdLevel != null
                      ? () async {
                          await storeUserData();
                          Get.to(OnboardingUserDetail2());
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

  Future<void> storeUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && selectedCkdLevel != null) {
      try {
        // Update the user details in Firestore
        await userDetailsCollection.doc(user.uid).set({
          
          'selectedCkdLevel': selectedCkdLevel,
          // Other user details...
        });
        print('User data updated successfully.');
      } catch (e) {
        print('Error updating user data: $e');
      }
    }
  }
}
