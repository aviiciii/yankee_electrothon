import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:renalcare/services/food_log_service.dart';

class addFood extends StatefulWidget {
  const addFood({Key? key}) : super(key: key);

  @override
  State<addFood> createState() => _addFoodState();
}

class _addFoodState extends State<addFood> {
  final DatabaseService _databaseService =
      DatabaseService("ulix3a2rwO2qjIVAKmgM");

  var today = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  void dispose() {
    // _foodController.dispose();
    super.dispose();
  }

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

            logs = logs.where((log) => log['date'] == today).toList();

            List breakfasts = logs
                .where((log) =>
                    log['time'] == 'Breakfast' || log['time'] == 'breakfast')
                .map((log) => log['food'])
                .toList();

            List lunches = logs
                .where(
                    (log) => log['time'] == 'Lunch' || log['time'] == 'lunch')
                .map((log) => log['food'])
                .toList();

            List dinners = logs
                .where(
                    (log) => log['time'] == 'Dinner' || log['time'] == 'dinner')
                .map((log) => log['food'])
                .toList();

            return ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                fooddate(),
                SizedBox(
                  height: 45,
                ),
                // if (logs.isEmpty) ...[
                //   Container(
                //     height: 180,
                //     padding: EdgeInsets.all(10),
                //     margin: EdgeInsets.only(bottom: 15),
                //     child: Container(
                //       height: 80,
                //       padding: EdgeInsets.all(10),
                //       margin: EdgeInsets.only(bottom: 15),
                //       // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "BreakFast",
                //             style: TextStyle(
                //                 fontSize: 20, fontWeight: FontWeight.bold),
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               showDialog(
                //                 context: context,
                //                 builder: (BuildContext context) {
                //                   return AlertDialog(
                //                     title: Text('Add Food'),
                //                     content: TextField(
                //                       // controller: _foodController,
                //                       decoration: InputDecoration(
                //                         hintText: 'add food name',
                //                       ),
                //                     ),
                //                     actions: [
                //                       TextButton(
                //                         onPressed: () {
                //                           // Save button logic
                //                           // String newFood = _foodController.text;
                //                           // setState(() {
                //                           //   _food = newFood;
                //                           // });
                //                           Navigator.of(context).pop();
                //                         },
                //                         child: Text('Save'),
                //                       ),
                //                       TextButton(
                //                         onPressed: () {
                //                           // Cancel button logic
                //                           Navigator.of(context).pop();
                //                         },
                //                         child: Text('Cancel'),
                //                       ),
                //                     ],
                //                   );
                //                 },
                //               );
                //             },
                //             child: Container(
                //               width: 160,
                //               height: 50,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10),
                //                   border: Border.all(color: Colors.black)),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Text("Add"),
                //                   Icon(Icons.add),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ],
                if (breakfasts.isEmpty) ...{
                  emptyFood('Breakfast'),
                } else ...{
                  for (var log in breakfasts) foodcontainer('Breakfast', log),
                },
                if (lunches.isEmpty) ...{
                  emptyFood('Lunch'),
                } else ...{
                  for (var log in lunches) foodcontainer('Lunch', log),
                },
                if (dinners.isEmpty) ...{
                  emptyFood('Dinner'),
                } else ...{
                  for (var log in dinners) foodcontainer('Dinner', log),
                },
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
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_food),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit Food'),
                          content: TextField(
                            // controller: _foodController,
                            decoration: InputDecoration(
                              hintText: 'Enter food name',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Save button logic
                                // String newFood = _foodController.text;
                                // setState(() {
                                //   _food = newFood;
                                // });
                                Navigator.of(context).pop();
                              },
                              child: Text('Save'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Cancel button logic
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.edit),
                ),
              ],
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
            String new_date = DateFormat('dd-MM-yyyy')
                .format(old_date.subtract(Duration(days: 1)));
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
            String new_date = DateFormat('dd-MM-yyyy')
                .format(old_date.add(Duration(days: 1)));
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

  Container emptyFood(String _time) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      child: Container(
        height: 80,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 15),
        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _time,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Add Food'),
                      content: TextField(
                        // controller: _foodController,
                        decoration: InputDecoration(
                          hintText: 'add food name',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Save button logic
                            // String newFood = _foodController.text;
                            // setState(() {
                            //   _food = newFood;
                            // });
                            Navigator.of(context).pop();
                          },
                          child: Text('Save'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Cancel button logic
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add"),
                    Icon(Icons.add),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
