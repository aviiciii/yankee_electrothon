import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:renalcare/models/test.dart';
import 'package:flutter/material.dart';



class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();


  get _db => FirebaseFirestore.instance;

  createUser(UserDetails userDetails)async{
    await _db.collection("UserDetails").add(userDetails.toMap()).whenComplete(
      ()=>Get.snackbar("Success", "Your account has been created",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText:Colors.green),  
    )
    .catchError((error,stackTrace){

      Get.snackbar("Error", error.message,
      snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText:Colors.red);
        print(error.toString());
    });
  
  }
}
