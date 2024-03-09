import 'package:flutter/material.dart';

class OnboardingUserDetail6 extends StatefulWidget {
  const OnboardingUserDetail6({super.key});

  @override
  State<OnboardingUserDetail6> createState() => _OnboardingUserDetail6State();
}

class _OnboardingUserDetail6State extends State<OnboardingUserDetail6> {
  int? selectedOption; // Track the selected option, null means no selection
  DateTime selectedDate = DateTime.now();

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
                  onPressed: () {},
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
