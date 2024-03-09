import 'package:flutter/material.dart';

class addFood extends StatefulWidget {
  const addFood({super.key});

  @override
  State<addFood> createState() => _addFoodState();
}

class _addFoodState extends State<addFood> {
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
            foodcontainer("Breakfast", "Biriyani"),
            foodcontainer("Lunch", "Roti"),
          ],
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
