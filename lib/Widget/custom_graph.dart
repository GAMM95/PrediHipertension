import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficaLinear extends StatelessWidget {
  const GraficaLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          minY: 60,
          maxY: 80,
          lineBarsData: [
            LineChartBarData(
                // spots: tempsToStops(mtvTemps),
                color: Colors.blue,
                barWidth: 3,
                isCurved: true),
          ],
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
                // axisNameSize: Text('Cantidad de Test'),
                ),
          )),
    );
  }
}
