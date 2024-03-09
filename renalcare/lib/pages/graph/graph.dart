import 'package:flutter/material.dart';
import 'package:renalcare/pages/graph/bar_chart.dart';
import 'package:renalcare/widgets/bottomnav.dart';

class myGraph extends StatefulWidget {
  const myGraph({super.key});

  @override
  State<myGraph> createState() => _myGraphState();
}

class _myGraphState extends State<myGraph> {
  // List of calories
  List<double> weeklySummary = [
    40.00,
    2.50,
    42.42,
    10.50,
    100.20,
    88.99,
    90.10
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      appBar: AppBar(
        title: Text(
          " Graph",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Text(
            "Weekly Report",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Based on Food Consumption",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 100),
          Center(
            child: SizedBox(
              height: 400,
              child: barChart(
                weeklySummary: weeklySummary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
