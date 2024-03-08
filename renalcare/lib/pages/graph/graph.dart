import 'package:flutter/material.dart';
import 'package:renalcare/pages/graph/bar_chart.dart';

class myGraph extends StatefulWidget {
  const myGraph({super.key});

  @override
  State<myGraph> createState() => _myGraphState();
}

class _myGraphState extends State<myGraph> {
  // List of calories
  List<int> weeklySummary = [4, 40, 2, 42, 10, 100, 88, 90];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: barChart(
            weeklySummary: weeklySummary,
          ),
        ),
      ),
    );
  }
}
