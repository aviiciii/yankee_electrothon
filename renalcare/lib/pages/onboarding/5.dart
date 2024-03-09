import 'package:flutter/material.dart';

class OnboardingUserDetail5 extends StatefulWidget {
  const OnboardingUserDetail5({super.key});

  @override
  State<OnboardingUserDetail5> createState() => _OnboardingUserDetail5State();
}

class _OnboardingUserDetail5State extends State<OnboardingUserDetail5> {

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
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
              if (dateTime != null){
                setState(() {
                  selectedDate = dateTime;
                });
              }
            },
          )
        ],
      )
    );
  }
}