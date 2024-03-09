import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/onboarding/6.dart';

class OnboardingUserDetail5 extends StatefulWidget {
  const OnboardingUserDetail5({super.key});

  @override
  State<OnboardingUserDetail5> createState() => _OnboardingUserDetail5State();
}

class _OnboardingUserDetail5State extends State<OnboardingUserDetail5> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Whats your birthdate?',
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
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.to(OnboardingUserDetail6());
                },
                child: Icon(Icons.arrow_forward_outlined),
              ),
              SizedBox(width: 40),
            ],
          ),
        ],
      )),
    );
  }
}
