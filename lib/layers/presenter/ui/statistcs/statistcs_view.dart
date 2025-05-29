import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
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

  String msgStatistcs = "";
  Color corMensagem = Colors.green;

  Future<List<ParseObject>>? getMood() async {
    final user = await ParseUser.currentUser() as ParseUser;
    final mood = QueryBuilder(ParseObject("Humor"));
    mood.whereEqualTo("user", user);
    final response = await mood.find();

    double y1 = 0; //Muito bem
    double y2 = 0; //Bem
    double y3 = 0; //Mais ou menos
    double y4 = 0; //Mal
    double y5 = 0; //Muito mal

    for (int i = 0; i < (response.length); i++) {
      switch (response[i].get("title")) {
        case "Muito bem":
          y1++;
          break;
        case "Bem":
          y2++;
          break;
        case "Mais ou menos":
          y3++;
          break;
        case "Mal":
          y4++;
          break;
        case "Muito mal":
          y5++;
          break;
        default:
          break;
      }
    }
    
    List<double> valores = [y1, y2, y3, y4, y5];
    double maior = valores.reduce(max);

    if (maior == y1) {
      corMensagem = Colors.green;
      msgStatistcs =
          "Que maravilha saber que você teve um dia tão positivo! Aproveite esse momento para fortalecer ainda mais sua saúde emocional. Continue cultivando o que te faz bem.";
    } else if (maior == y2) {
      corMensagem = Colors.blue;
      msgStatistcs =
          "Fico feliz por saber que seu dia foi bom. Use essa estabilidade como uma base para investir em hábitos saudáveis para sua mente e bem-estar.";
    } else if (maior == y3) {
      corMensagem = Colors.yellow;
      msgStatistcs =
          "Dias medianos também fazem parte do processo. Que tal tirar um tempinho para cuidar de você e renovar suas energias? Seu bem-estar merece atenção.";
    } else if (maior == y4) {
      corMensagem = Colors.orange;
      msgStatistcs =
          "Sinto muito por hoje ter sido difícil. Lembre-se: cuidar da sua saúde emocional é um gesto de coragem. Permita-se descansar, refletir e buscar apoio se precisar.";
    } else if (maior == y5) {
      corMensagem = Colors.red;
      msgStatistcs =
          "Momentos como este exigem acolhimento e cuidado. Sua saúde emocional importa — respire, se cuide e, se possível, converse com alguém de confiança. Você não está sozinho(a).";
    }
        setState(() {
      
    });


    return response;
  }

  @override
  Widget build(BuildContext context) {
    // Conta quantas tarefas foram feitas
    int terapiasRealizadas =
        tarefasDaSemana.values.where((feito) => feito).length;

    // Define mensagem e cor com base nas terapias realizadas
    String mensagemFinal = '';
    
    
    // if (terapiasRealizadas <= 2) {
    //   mensagemFinal =
    //       'Não foi nada bem, mas eu sei que ainda pode melhorar e ter um bom progresso na próxima semana.';
    //   corMensagem = Colors.orange;
    // } else if (terapiasRealizadas <= 4) {
    //   mensagemFinal =
    //       'Você não foi tão bem, mas eu sei que na próxima semana podes melhorar com um pouco mais de dedicação.';
    //   corMensagem = Colors.yellow[800]!;
    // } else {
    //   mensagemFinal =
    //       'Você foi muito bem, estou gostando da sua dedicação, continue assim.';
    //   corMensagem = Colors.green;
    // }
    

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'O meu relatório',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<ParseObject>>(
                future: getMood(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    //          ListTile(
                    // leading: Text(
                    //   snapshot.data?[index].get(
                    //     "emoji",
                    //   ),
                    //   style: TextStyle(fontSize: 30),
                    // ),
                    // title: Text(snapshot.data?[index].get("title")),
                    // subtitle: Text(snapshot.data?[index].get("describe")),
                    // trailing: Text(
                    //     "${snapshot.data?[index].createdAt!.toIso8601String().substring(0, 10)}"),
                    // );
                    double y1 = 0; //Muito bem
                    double y2 = 0; //Bem
                    double y3 = 0; //Mais ou menos
                    double y4 = 0; //Mal
                    double y5 = 0; //Muito mal

                    for (int i = 0; i < (snapshot.data?.length ?? 0); i++) {
                      switch (snapshot.data?[i].get("title")) {
                        case "Muito bem":
                          y1++;
                          break;
                        case "Bem":
                          y2++;
                          break;
                        case "Mais ou menos":
                          y3++;
                          break;
                        case "Mal":
                          y4++;
                          break;
                        case "Muito mal":
                          y5++;
                          break;
                        default:
                          break;
                      }
                    }

                    return AspectRatio(
                      aspectRatio: 1,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: double.parse("${snapshot.data?.length}"),
                          barTouchData: BarTouchData(enabled: true),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                reservedSize: 40,
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  //   final List<String> emojis = [
                                  //     "😭", // Muito Ruim
                                  //     "😟", // Ruim
                                  //     "😐", // Mais ou Menos
                                  //     "🙂", // Bom
                                  //     "😁", // Ótimo

                                  final days = ['😁', '🙂', '😐', '😟', '😭'];
                                  return Text(
                                    days[value.toInt()],
                                    style: const TextStyle(fontSize: 24),
                                  );
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: true),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                  toY: y1, color: Colors.green, width: 15)
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: y2, color: Colors.blue, width: 15)
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: y3, color: Colors.yellow, width: 15)
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                  toY: y4, color: Colors.orange, width: 15)
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                  toY: y5, color: Colors.red, width: 15)
                            ]),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Houve um erro: ${snapshot.error}");
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: corMensagem,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                msgStatistcs,
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
      ),
    );
  }
}
/*

1. Quando o dia foi muito bem
"Que maravilha saber que você teve um dia tão positivo! Aproveite esse momento para fortalecer ainda mais sua saúde emocional. Continue cultivando o que te faz bem."

😊 2. Quando o dia foi bem
"Fico feliz por saber que seu dia foi bom. Use essa estabilidade como uma base para investir em hábitos saudáveis para sua mente e bem-estar."

😐 3. Quando o dia foi mais ou menos
"Dias medianos também fazem parte do processo. Que tal tirar um tempinho para cuidar de você e renovar suas energias? Seu bem-estar merece atenção."

😞 4. Quando o dia foi mal
"Sinto muito por hoje ter sido difícil. Lembre-se: cuidar da sua saúde emocional é um gesto de coragem. Permita-se descansar, refletir e buscar apoio se precisar."

💔 5. Quando o dia foi muito mal
"Momentos como este exigem acolhimento e cuidado. Sua saúde emocional importa — respire, se cuide e, se possível, converse com alguém de confiança. Você não está sozinho(a)."

*/
