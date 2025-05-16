import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
//import 'package:fl_chart/fl_chart.dart';

class StatistcsView extends StatefulWidget {
  const StatistcsView({super.key});

  @override
  State<StatistcsView> createState() => _StatistcsViewState();
}

class _StatistcsViewState extends State<StatistcsView> {
  // Mapa representando as terapias feitas de segunda a sábado
  Map<String, bool> tarefasDaSemana = {
    'Seg': true,
    'Ter': true,
    'Qua': false,
    'Qui': true,
    'Sex': false,
    'Sab': false,
  };

  @override
  Widget build(BuildContext context) {
    // Conta quantas tarefas foram feitas
    int terapiasRealizadas = tarefasDaSemana.values.where((feito) => feito).length;

    // Define mensagem e cor com base nas terapias realizadas
    String mensagemFinal = '';
    Color corMensagem = Colors.green;

    if (terapiasRealizadas <= 2) {
      mensagemFinal = 'Não foi nada bem, mas eu sei que ainda pode melhorar e ter um bom progresso na próxima semana.';
      corMensagem = Colors.orange;
    } else if (terapiasRealizadas <= 4) {
      mensagemFinal = 'Você não foi tão bem, mas eu sei que na próxima semana podes melhorar com um pouco mais de dedicação.';
      corMensagem = Colors.yellow[800]!;
    } else {
      mensagemFinal = 'Você foi muito bem, estou gostando da sua dedicação, continue assim.';
      corMensagem = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'O meu relatório',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 1,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withOpacity(0.3),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final dias = ['😊', '🙂', '😕', '😐', '😒', '😞'];
                        if (value >= 0 && value < dias.length) {
                          return Text(dias[value.toInt()]);
                        }
                        return const SizedBox.shrink();
                      },
                      reservedSize: 40,
                      interval: 1,
                    ),
                  ),
                  bottomTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 1,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0.5, terapiasRealizadas.toDouble()),
                    ],
                    isCurved: false,
                    barWidth: 2,
                    color: Colors.blue,
                    dotData: const FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: corMensagem,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              mensagemFinal,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            DateTime.now().toString().substring(0, 11),
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}


// class EstatisticasPage extends StatelessWidget {
//   final Map<int, double> humorDiario = {
//     28: 2, // Dia 28: "Mais ou Menos"
//   };

//   final Map<String, double> humorSemanal = {
//     "Dom": 0,
//     "Seg": 0,
//     "Ter": 0,
//     "Qua": 0,
//     "Qui": 0,
//     "Sex": 2,
//     "Sáb": 0,
//   };

//   final List<String> emojis = [
//     "😭", // Muito Ruim
//     "😟", // Ruim
//     "😐", // Mais ou Menos
//     "🙂", // Bom
//     "😁", // Ótimo
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MindDiary'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             Center(child: Text("Humor Diário", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
//             SizedBox(height: 200, child: LineChart(_buildHumorDiarioChart())),
//             SizedBox(height: 32),
//             Center(child: Text("Humor Semanal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
//             SizedBox(height: 200, child: BarChart(_buildHumorSemanalChart())),
//           ],
//         ),
//       ),
//     );
//   }

//   LineChartData _buildHumorDiarioChart() {
//     return LineChartData(
//       minY: 0,
//       maxY: 4,
//       gridData: FlGridData(show: false),
//       titlesData: FlTitlesData(
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: (value, _) {
//               int idx = value.toInt();
//               if (idx < 0 || idx >= emojis.length) return Text('');
//               return Text(emojis[idx], style: TextStyle(fontSize: 20));
//             },
//             reservedSize: 32,
//           ),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: (value, _) => Text("Dia ${value.toInt()}"),
//           ),
//         ),
//       ),
//       borderData: FlBorderData(show: true),
//       lineBarsData: [
//         LineChartBarData(
//           spots: humorDiario.entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
//           isCurved: false,
//           barWidth: 4,
//           colors: [Colors.amber],
//           dotData: FlDotData(show: true),
//         ),
//       ],
//     );
//   }

//   BarChartData _buildHumorSemanalChart() {
//     final dias = humorSemanal.keys.toList();
//     final grupos = List.generate(dias.length, (i) {
//       double valor = humorSemanal[dias[i]]!;
//       return BarChartGroupData(
//         x: i,
//         barRods: [
//           BarChartRodData(
//             toY: valor,
//             width: 18,
//             color: Colors.amber,
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ],
//         showingTooltipIndicators: [0],
//       );
//     });

//     return BarChartData(
//       maxY: 4,
//       gridData: FlGridData(show: false),
//       barTouchData: BarTouchData(
//         enabled: false,
//         touchTooltipData: BarTouchTooltipData(tooltipBgColor: Colors.transparent),
//       ),
//       titlesData: FlTitlesData(
//         leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: (value, _) => Column(
//               children: [
//                 Text(
//                   emojis[humorSemanal[dias[value.toInt()]]!.toInt()],
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 Text(dias[value.toInt()], style: TextStyle(fontSize: 12)),
//               ],
//             ),
//           ),
//         ),
//         topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//         rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//       ),
//       borderData: FlBorderData(show: true),
//       barGroups: grupos,
//     );
//   }
// }

