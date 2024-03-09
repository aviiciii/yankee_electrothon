import 'package:flutter/material.dart';
import 'package:renalcare/widgets/bottomnav.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          "User Information",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Email',
                ),
              ),
              Text(
                "Age",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Age',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("UPDATE"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}
