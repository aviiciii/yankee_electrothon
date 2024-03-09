import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnboardingUserDetail6 extends StatefulWidget {
  const OnboardingUserDetail6({Key? key}) : super(key: key);

  @override
  _OnboardingUserDetail6State createState() => _OnboardingUserDetail6State();
}

class _OnboardingUserDetail6State extends State<OnboardingUserDetail6> {
  int? selectedOption; // Track the selected option, null means no selection

  // Reference to Firestore collection
  final CollectionReference userDetailsCollection =
      FirebaseFirestore.instance.collection('UserDetails');

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  onPressed: () {
                    // Save data to Firestore when button is pressed
                    if (selectedOption != null) {
                      saveDataToFirestore();
                      // Navigate to the next page, e.g., HomePage()
                    }
                  },
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

  Future<void> saveDataToFirestore() async {
    try {
      // Get the current user
      User? user = _auth.currentUser;

      if (user != null) {
        // Add document to Firestore
        await userDetailsCollection.doc(user.uid).set({
          'userId': user.uid, // Save the user ID
          'hasDiabetes': selectedOption == 1 ? true : false, // Convert radio button value to boolean
          'timestamp': DateTime.now(), // Optional: Add a timestamp
        });
        print('Data saved to Firestore successfully');
      } else {
        print('User is not signed in.');
      }
    } catch (e) {
      print('Error saving data: $e');
      // Handle errors
    }
  }
}
