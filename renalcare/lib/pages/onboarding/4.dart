import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OnboardingUserDetail4 extends StatefulWidget {
  final int? selectedDiabetesOption; // Corrected parameter name

  const OnboardingUserDetail4({Key? key, this.selectedDiabetesOption, int? selectedBloodPressureOption}) : super(key: key);

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
              'Do you have \n Diabetes?',
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
                          // Store user data in Firebase
                          _storeUserData(selectedOption!);
                          // Navigate to the homepage
                          Get.to(homePage());
                        }
                      : null, // Disable the button if no option is selected
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

  // Function to store user data in Firebase
  void _storeUserData(int selectedOption) async {
    try {
      await Firebase.initializeApp();
      // Access Firestore and add the user data to a collection
      await FirebaseFirestore.instance.collection('user_data').add({
        'hasDiabetes': selectedOption == 1, // Convert radio button value to boolean
        'timestamp': DateTime.now(), // Optional: Add a timestamp
      });
      print('User data stored successfully.');
    } catch (e) {
      print('Error storing user data: $e');
    }
  }
}
