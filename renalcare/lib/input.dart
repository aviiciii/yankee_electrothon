import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {

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
                hintText: 'Input Field 2',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _uidcontroller,
              decoration: InputDecoration(
                hintText: 'Input Field 3',
              ),
            ),
          ],
        ),
      ),
    );
  }
}