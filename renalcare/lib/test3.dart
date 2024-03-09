// // Define a data model to represent user information
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class UserData {
//   final int ckdLevel;
//   final bool hasBp;
//   final bool hasDiabetes;
//   final bool isDialysis;

//   UserData({
//     required this.ckdLevel,
//     required this.hasBp,
//     required this.hasDiabetes,
//     required this.isDialysis,
//   });

//   // Convert user data to a map for Firestore
//   Map<String, dynamic> toMap() {
//     return {
//       'ckdLevel': ckdLevel,
//       'hasBp': hasBp,
//       'hasDiabetes': hasDiabetes,
//       'isDialysis': isDialysis,
//     };
//   }
// }

// // In the last page where the user answers the last question
// class LastPage extends StatelessWidget {
//   final int selectedCkdLevel;
//   final bool selectedBpOption;
//   final bool selectedDiabetesOption;
//   final bool selectedDialysisOption;

//   const LastPage({
//     required this.selectedCkdLevel,
//     required this.selectedBpOption,
//     required this.selectedDiabetesOption,
//     required this.selectedDialysisOption,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Create user data object
//     final userData = UserData(
//       ckdLevel: selectedCkdLevel,
//       hasBp: selectedBpOption,
//       hasDiabetes: selectedDiabetesOption,
//       isDialysis: selectedDialysisOption,
//     );

//     // Store user data in Firebase
//     _storeUserData(userData);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Thank You!'),
//       ),
//       body: Center(
//         child: Text('User data stored in Firebase.'),
//       ),
//     );
//   }

//   // Function to store user data in Firebase
//   void _storeUserData(UserData userData) {
//     try {
//       // Access Firestore and add the user data to a collection
//       FirebaseFirestore.instance.collection('user_data').add(userData.toMap());
//       print('User data stored successfully.');
//     } catch (e) {
//       print('Error storing user data: $e');
//     }
//   }
// }
