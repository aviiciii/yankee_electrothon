import 'package:flutter/material.dart';
import 'package:renalcare/models/test.dart';
import 'package:renalcare/services/test_service.dart';


class TextFieldPage extends StatefulWidget {

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {

  final DatabaseService _databaseService = DatabaseService();

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _phonecontroller = TextEditingController();

  final TextEditingController _uidcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Fields'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phonecontroller,
              decoration: InputDecoration(
                hintText: 'Phone',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _uidcontroller,
              decoration: InputDecoration(
                hintText: 'UID',
              ),
            ),
            // add button
            ElevatedButton(
              onPressed: () {
                // create user details obj
                UserDetails userDetails = UserDetails(
                  email: _emailcontroller.text,
                  phone: _phonecontroller.text,
                  uid: _uidcontroller.text
                );

                // add user details to firebase
                _databaseService.add_user(userDetails);


                // print the input text
                print(_emailcontroller.text);
                print(_phonecontroller.text);
                print(_uidcontroller.text);
                // clear the text field
                _emailcontroller.clear();
                _phonecontroller.clear();
                _uidcontroller.clear();
              },
              child: const Text('Submit'),
            ),

          ],
        ),
      ),
    );
  }
}