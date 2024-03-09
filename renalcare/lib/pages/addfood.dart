import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:renalcare/services/food_log_service.dart';


class addFood extends StatefulWidget {
  const addFood({super.key});

  @override
  State<addFood> createState() => _addFoodState();
}

class _addFoodState extends State<addFood> {
  @override
  Widget build(BuildContext context) {
    final DatabaseService _databaseService = DatabaseService("ulix3a2rwO2qjIVAKmgM");

    String today = DateFormat('dd-MM-yyyy').format(DateTime.now());

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

            // get today logs
            logs = logs.where((log) => log['date'] == today).toList();

            if (logs.isEmpty) {
              return const Center(
                child: Text('No users found'),
              );
            }

            return ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                fooddate(today),
                for (var log in logs)
                  foodcontainer(log['food'], log['time']),
                foodcontainer("Lunch", "Roti"),
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

  Row fooddate(String _date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        Text(
          _date,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    );
  }
}