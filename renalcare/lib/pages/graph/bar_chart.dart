import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:renalcare/pages/graph/bar_data.dart';

class barChart extends StatelessWidget {
  final List weeklySummary;
  const barChart({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    // initialize BarData
    BarData myBarData = BarData(
      sunday: weeklySummary[0],
      monday: weeklySummary[1],
      tuesday: weeklySummary[2],
      wednesday: weeklySummary[3],
      thursday: weeklySummary[4],
      friday: weeklySummary[5],
      saturday: weeklySummary[6],
    );

    myBarData.initialzeBarData();

    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Colors.grey[800],
                  width: 25,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, toY: 100, color: Colors.grey[200]),
                )
              ]),
            )
            .toList(),
      ),
    );
  }
}
