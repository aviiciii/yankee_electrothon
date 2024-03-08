import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renalcare/pages/onboarding/1.dart';

class nextButton extends StatelessWidget {
  const nextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(OnboardingUserDetail1());
      },
      child: Icon(Icons.arrow_forward_outlined),
    );
  }
}
