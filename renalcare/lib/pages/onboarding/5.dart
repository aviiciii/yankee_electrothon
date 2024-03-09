import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/onboarding/8.dart';
import 'package:renalcare/pages/profile.dart';

class OnboardingUserDetail5 extends StatefulWidget {
  const OnboardingUserDetail5({Key? key}) : super(key: key);

  @override
  State<OnboardingUserDetail5> createState() => _OnboardingUserDetail5State();
}

class _OnboardingUserDetail5State extends State<OnboardingUserDetail5> {
  DateTime selectedDate = DateTime.now();

  Future<void> _saveDateToFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('UserDetails');
        await users.doc(user.uid).update({
          'birth_date': selectedDate,
        });
        print('Birthdate updated successfully.');

        // Navigate to the profile page
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (context) => ()),
        // );
      } else {
        print('User not authenticated.');
      }
    } catch (e, stackTrace) {
      print('Error updating birthdate: $e');
      print('StackTrace: $stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'What\'s your birthdate?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Choose Date'),
                  onPressed: () async {
                    DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (dateTime != null) {
                      setState(() {
                        selectedDate = dateTime;
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _saveDateToFirestore();
                    // Navigate to the profile page
                  },
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
