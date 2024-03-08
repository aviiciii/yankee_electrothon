



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:renalcare/db/test.dart';
import 'package:renalcare/user_repository.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();


 
final email = TextEditingController();
final name = TextEditingController();
final phone = TextEditingController();
final address = TextEditingController();

final userRepo=Get.put(UserRepository());



Future<void>createUser(UserDetails userDetails) async {
  await userRepo.createUser(UserDetails(
    // Pass the required parameters for UserDetails constructor
    name: name.text,
    email: email.text,
    phone: phone.text,
  ));
}
}