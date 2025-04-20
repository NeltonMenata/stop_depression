import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
//import 'package:fl_chart/fl_chart.dart';

class StatistcsView extends StatefulWidget {
  const StatistcsView({super.key});

  @override
  State<StatistcsView> createState() => _StatistcsViewState();
}

class _StatistcsViewState extends State<StatistcsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Estatisticas"),
        SizedBox(
            width: 300,
            height: 500,
            child: Column(
              children: [
                Text(
                  'O meu relatório',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                            print(meta.formattedValue);
                            return Column(
                              children: [Text("A")],
                            );
                          },)
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false)
                        )
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 4,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(1, 2),
                            FlSpot(2, 4),
                            FlSpot(3, 1),
                            FlSpot(4, 3),
                          ],
                          color: Colors.amber,
                          isCurved: true,
                          // colors: [
                          //   Colors.red,
                          //   Colors.orange,
                          //   Colors.yellow,
                          //   Colors.green
                          // ],
                          barWidth: 4,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Você foi muito bem. Estou gostando da sua dedicação. Continue assim.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Sáb, 22/03/24',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            )),
      ],
    );
  }
}
