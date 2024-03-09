import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:renalcare/pages/onboarding/3.dart';

class OnboardingUserDetail2 extends StatefulWidget {
  const OnboardingUserDetail2({Key? key}) : super(key: key);

  @override
  _OnboardingUserDetail2State createState() => _OnboardingUserDetail2State();
}

class _OnboardingUserDetail2State extends State<OnboardingUserDetail2> {
  int? selectedOption; // Track the selected option, null means no selection

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
              'Are you on Dialysis?',
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
      ? () async {
          // Get the current user
          User? user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            // Store the dialysis status along with the user ID in Firestore
            await userDetailsCollection.doc(user.uid).set({
              'userId': user.uid,
              'isDialysis': selectedOption == 1, // true if selectedOption is 1
            });

            // Navigate to the next page
            // Get.to(OnboardingUserDetail3());
          } else {
            // Handle the case where the user is not signed in
            print('User is not signed in.');
          }
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
