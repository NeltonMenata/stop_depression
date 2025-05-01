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
          Text(
            'O meu relatório',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
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
                        final dias = ['🙁', 'Ter', 'Qua', 'Qui', 'Sex', '😳'];
                        if (value >= 0 && value < dias.length) {
                          return Text(dias[value.toInt()]);
                        }
                        return const SizedBox.shrink();
                      },
                      reservedSize: 40,
                      interval: 1,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
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
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: corMensagem,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              mensagemFinal,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Text(
            DateTime.now().toString().substring(0, 11),
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
