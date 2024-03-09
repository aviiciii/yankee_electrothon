import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:renalcare/services/food_log_service.dart';


class addFood extends StatefulWidget {
  const addFood({super.key});

  @override
  State<addFood> createState() => _addFoodState();
}

class _addFoodState extends State<addFood> {

  final DatabaseService _databaseService = DatabaseService("ulix3a2rwO2qjIVAKmgM");

  var today = DateFormat('dd-MM-yyyy').format(DateTime.now());



  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        

        child: StreamBuilder(
          stream: _databaseService.get_food_logs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            
            List logs = snapshot.data?.docs ?? [];

            print('rebuild' + today);

            
            logs = logs.where((log) => log['date'] == today).toList();

            logs.sort((a, b) {
              // Extract the time from the logs
              var timeA = a['time'].toLowerCase();
              var timeB = b['time'].toLowerCase();

              // Compare the time values
              if (timeA == 'breakfast') {
                return -1;
              } else if (timeB == 'breakfast') {
                return 1;
              } else if (timeA == 'lunch') {
                return -1;
              } else if (timeB == 'lunch') {
                return 1;
              } else if (timeA == 'dinner') {
                return -1;
              } else if (timeB == 'dinner') {
                return 1;
              } else {
                return 0;
              }
            });

            return ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                fooddate(),
                if (logs.isEmpty) ...[
                  Text('No food logs found'),
                ],

                for (var log in logs)
                  foodcontainer(log['time'], log['food']),
                
              ],
            );
          },
        ),
      ),
    );
  }

  Container foodcontainer(String _foodtype, String _food) {
    return Container(
      height: 80,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _foodtype,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(_food), Icon(Icons.edit)],
            ),
          )
        ],
      ),
    );
  }

  Row fooddate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            DateTime old_date = new DateFormat('dd-MM-yyyy').parse(today);
            String new_date = DateFormat('dd-MM-yyyy').format(old_date.subtract(Duration(days: 1)));
            print(new_date);
            today = new_date;
            setState(() {
              today = new_date;
            });
          },
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        Text(
          today,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {
            DateTime old_date = new DateFormat('dd-MM-yyyy').parse(today);
            String new_date = DateFormat('dd-MM-yyyy').format(old_date.add(Duration(days: 1)));
            today = new_date;
            setState(() {
              today = new_date;
            });
            
          },
          child: Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    );
  }
}