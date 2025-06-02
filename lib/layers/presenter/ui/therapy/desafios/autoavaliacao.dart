import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:stop_depression/layers/presenter/utils/utils.dart';

class AutoavaliacaoPage extends StatefulWidget {
  @override
  _AutoavaliacaoPageState createState() => _AutoavaliacaoPageState();
}

class _AutoavaliacaoPageState extends State<AutoavaliacaoPage> {
  List<Map<String, dynamic>> tarefas = [];

  final List<String> desafios = [
    "Escreva sobre um momento difícil que você superou. Relembre sua força.",
    "Faça uma atividade fora da rotina: pinte, desenhe, escreva poesia, fotografe.",
    "Desafie um pensamento negativo com uma resposta positiva e realista.",
    "Converse com alguém que você não fala há um tempo. Reconectar é cura.",
    "Tire 10 minutos para respirar profundamente e fazer um check-in emocional.",
    "Faça uma lista das coisas que te dão medo — depois, marque as que você já enfrentou.",
    "Escreva o que você aprendeu com esses desafios e o que sentiu ao longo do caminho.",
    "Reflita sobre o que você mais evita — e o que isso diz sobre você.",
    "Observe como você fala consigo mesma — troque críticas por compaixão.",
    "Escreva sobre um arrependimento — e o que ele te ensinou.",
    "Tire 15 minutos para observar seus sentimentos sem julgamento.",
    "Faça uma lista do que você quer mudar em sua vida e por quê.",
    "Responda: quem é você sem os papéis que desempenha?",
    "Lembre-se de um conselho valioso que alguém te deu.",
    "Escreva 3 coisas que você faria se não tivesse medo.",
    "Avalie seus hábitos: quais te ajudam e quais te sabotam?",
    "Reveja seus objetivos e pergunte: ainda fazem sentido?",
    "Liste suas principais prioridades atualmente — elas refletem seus valores?",
    "Escreva sobre o que te acalma e por que isso é importante.",
    "Registre o que te tirou do sério essa semana — e por quê.",
    "Pense em como você reage ao fracasso. Que mensagem tira disso?",
    "Escreva sua definição pessoal de felicidade.",
    "Pergunte-se: o que te impede de ser quem você quer ser?",
  ];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tarefasSalvas = prefs.getString('autoavaliacao');
    if (tarefasSalvas != null) {
      setState(() {
        tarefas = List<Map<String, dynamic>>.from(jsonDecode(tarefasSalvas));
      });
    }
  }

  Future<void> salvarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('autoavaliacao', jsonEncode(tarefas));
  }

  void adicionarTarefa() {
    setState(() {
      tarefas.add({
        "titulo": desafios[tarefas.length % desafios.length],
        "feito": false,
        "lembrete": false,
      });
      salvarTarefas();
    });
  }

  void marcarComoFeita(int index) {
    setState(() {
      tarefas[index]["feito"] = !tarefas[index]["feito"];
      salvarTarefas();
    });
  }

  int contarEstrelas() {
    int feitas = tarefas.where((t) => t["feito"]).length;
    return feitas ~/ 5;
  }

  @override
  Widget build(BuildContext context) {
    int feitas = tarefas.where((t) => t["feito"]).length;
    int total = tarefas.length;
    int estrelas = contarEstrelas();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenLight,
        title: const Text(
          "Autoavaliação e reflexão pessoal",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              if (feitas >= 7)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: LinearProgressIndicator(
                    value: total == 0 ? 0 : feitas / total,
                    backgroundColor: Colors.grey[300],
                    color: Colors.green,
                    minHeight: 10,
                  ),
                ),
              if (feitas >= 7)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Você completou $feitas de $total desafios, continue assim!",
                      style: const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    final tarefa = tarefas[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.cyan[700],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                tarefa["titulo"],
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => marcarComoFeita(index),
                            child: CircleAvatar(
                              backgroundColor: tarefa["feito"]
                                  ? Colors.green
                                  : Colors.grey[800],
                              child: const Icon(Icons.check, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: adicionarTarefa,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Center(
                    child: Text(
                      "Próximo desafio",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    DateTime.now().toIso8601String().substring(0, 10),
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Estrelas: ${"⭐" * estrelas}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ],
      ),
    );
  }
}