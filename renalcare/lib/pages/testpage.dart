import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:renalcare/services/firebase_service.dart';

class testPage extends StatefulWidget {
  const testPage({super.key});


  @override
  State<testPage> createState() => _testPageState();
}

class _testPageState extends State<testPage> {

  final DatabaseService _databaseService = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userListView(), 
    );
  }

Widget userListView(){
  return SizedBox(
    
    child: StreamBuilder(
      stream: _databaseService.get_users(), 
      builder: (context, snapshot){
        List userDetails = snapshot.data?.docs ?? [];

        if (userDetails.isEmpty) {
          return const Center(
            child: Text('No users found'),
          );
        }

        return ListView.builder(
          itemCount: userDetails.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(userDetails[0]['email']),
              subtitle: Text(userDetails[0]['phone']),
              trailing: Text(userDetails[0].id),
                 // print id of the document

            );
          },
        );
    }),
  );
  }
  
}

