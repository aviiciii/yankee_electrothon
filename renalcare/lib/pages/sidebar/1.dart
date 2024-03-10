import 'package:flutter/material.dart';
import 'package:renalcare/widgets/bottomnav.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  late DateTime selectedDate;


  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now(); // Initialize selectedDate in initState
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Information",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
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
                "Do you have Diabetes?",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type 'Yes' or 'No'",
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Do you have Blood Pressure?",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type 'Yes' or 'No'",
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "What is your CKD level? (1-5)",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your CKD level',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 25,
              ),           
              Center(child: Text('Enter your DOB', style: TextStyle(fontSize: 20))),
              Center(
                child: Text(
                      "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
                 Center(
                   child: ElevatedButton(
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
                 ),
                 SizedBox(
                height: 25,
              ), 
                 Center(child: Text('When was your First Dialysis', style: TextStyle(fontSize: 20))),
                Center(
                child: Text(
                      "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              ),
                 Center(
                   child: ElevatedButton(
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
                 ),
                 SizedBox(
                height: 25,
              ),
                 Center(
                  child: TextButton(
                  onPressed: () {
                    // TODO: Add functionality to update the user information
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set your desired background color here
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.blue, // Set your desired border color here
                        width: 5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white, // Set your desired text color here
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}
