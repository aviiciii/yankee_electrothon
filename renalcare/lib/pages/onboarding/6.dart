import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:renalcare/pages/profile.dart';

class OnboardingUserDetail6 extends StatefulWidget {
  const OnboardingUserDetail6({Key? key}) : super(key: key);

  @override
  State<OnboardingUserDetail6> createState() => _OnboardingUserDetail6State();
}

class _OnboardingUserDetail6State extends State<OnboardingUserDetail6> {
  late DateTime selectedDate; // Changed to late initialization

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now(); // Initialize selectedDate in initState
  }
Future<void> _saveDateToFirestore() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference users =
          FirebaseFirestore.instance.collection('UserDetails');
      await users.doc(user.uid).update({
        'first_dialysis_date': selectedDate,
      });
      print('Dialysis date updated successfully.');
      
      // Navigate to the homepage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => profile()),
      );
    } else {
      print('User not authenticated.');
    }
  } catch (e, stackTrace) {
    print('Error updating dialysis date: $e');
    print('StackTrace: $stackTrace');
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'When was your first dialysis? ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000),
                      );
                      if (dateTime != null) {
                        setState(() {
                          selectedDate = dateTime;
                        });
                      }
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _saveDateToFirestore();
                    // Navigate to the next screen
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
