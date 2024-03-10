import 'package:flutter/material.dart';

class addDialysis extends StatelessWidget {
  const addDialysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Dialysis log"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Add Dialysis"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Past Dialysis Logs",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            dateComponent("2021-10-10"),
          ],
        ),
      ),
    );
  }

  Container dateComponent(String _datepassed) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Date :",
            style: TextStyle(fontSize: 20),
          ),
          Text(_datepassed, style: TextStyle(fontSize: 15)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 184, 18, 7),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
