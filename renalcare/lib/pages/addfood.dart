import 'package:flutter/material.dart';

class addFood extends StatefulWidget {
  const addFood({Key? key}) : super(key: key);

  @override
  State<addFood> createState() => _addFoodState();
}

class _addFoodState extends State<addFood> {
  TextEditingController _foodController = TextEditingController();

  @override
  void dispose() {
    _foodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            fooddate("Feb 29"),
            SizedBox(
              height: 15,
            ),
            foodcontainer("Breakfast", "Biriyani"),
            foodcontainer("Lunch", "Roti"),
            foodcontainer("Dinner", "Dosai"),
          ],
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
                            controller: _foodController,
                            decoration: InputDecoration(
                              hintText: 'Enter food name',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // Save button logic
                                String newFood = _foodController.text;
                                setState(() {
                                  _food = newFood;
                                });
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
