import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renalcare/pages/onboarding/2.dart';

// OnboardingUserDetail1

class OnboardingUserDetail1 extends StatefulWidget {
  const OnboardingUserDetail1({Key? key}) : super(key: key);

  @override
  _OnboardingUserDetail1State createState() => _OnboardingUserDetail1State();
}

class _OnboardingUserDetail1State extends State<OnboardingUserDetail1> {
  int? selectedStage; // Track the selected stage, null means no selection

  // Reference to Firestore collection
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
              'What stage is your \n Kidney Disease?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            for (int i = 1; i <= 5; i++)
              RadioListTile<int>(
                title: Text('CKD STAGE $i'),
                value: i,
                groupValue: selectedStage,
                onChanged: (value) {
                  setState(() {
                    selectedStage = value;
                  });
                },
              ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: selectedStage != null
                      ? () async {
                          // Get the current user
                          User? user = FirebaseAuth.instance.currentUser;

                          if (user != null) {
                            // Store the selected CKD level along with the user ID in Firestore
                            await userDetailsCollection.doc(user.uid).set({
                              'userId': user.uid,
                              'ckdLevel': selectedStage,
                            });
                          } else {
                            // Handle the case where the user is not signed in
                            print('User is not signed in.');
                          }

                          // Navigate to the next page
                          Get.to(OnboardingUserDetail2());
                        }
                      : null, // Disable the button if no stage is selected
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
