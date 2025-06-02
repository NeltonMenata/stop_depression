import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:stop_depression/layers/presenter/utils/utils.dart';

class CoragemPage extends StatefulWidget {
  @override
  _CoragemPageState createState() => _CoragemPageState();
}

class _CoragemPageState extends State<CoragemPage> {
  List<Map<String, dynamic>> tarefas = [];

  final List<String> desafios = [
    "Faça algo que você sempre teve vontade, mas ficou com vergonha.",
    "Anote um medo que você tem e pense em um passo pequeno que pode dar em direção a enfrentá-lo.",
    "Enfrente um pequeno medo hoje: fale em público, poste uma foto, tente algo novo.",
    "Tome uma decisão sem pedir opinião de ninguém. Confie em si mesma.",
    "Escreva uma carta sobre algo que você teme — e depois queime ou rasgue.",
    "Vá a um lugar onde nunca foi antes. Enfrente o novo.",
    "Diga uma verdade difícil para alguém, com empatia.",
    "Experimente algo novo que sempre quis, mas adiou.",
    "Compartilhe algo pessoal com alguém de confiança.",
    "Tente algo que já falhou antes, mas com uma nova atitude.",
    "Fale algo em público, nem que seja em voz alta no espelho.",
    "Reconheça um erro seu e reflita sobre o que aprendeu.",
    "Enfrente um pensamento autocrítico com coragem.",
    "Faça uma escolha sem medo do julgamento dos outros.",
    "Fique sozinha por um tempo e observe seus sentimentos.",
    "Dê um passo fora da sua zona de conforto hoje.",
    "Escreva uma carta de perdão (mesmo que não envie).",
    "Reveja uma situação difícil e perceba como você lidou bem.",
    "Agradeça por algo que antes você temia, mas te ensinou.",
    "Imagine a pior coisa que poderia acontecer — e veja que você sobreviveria.",
    "Lembre-se de alguém corajoso que te inspira — e siga o exemplo.",
    "Comprometa-se com uma mudança que você vem adiando por medo."
  ];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tarefasSalvas = prefs.getString('coragem');
    if (tarefasSalvas != null) {
      setState(() {
        tarefas = List<Map<String, dynamic>>.from(jsonDecode(tarefasSalvas));
      });
    }
  }

  Future<void> salvarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('coragem', jsonEncode(tarefas));
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

  void alternarLembrete(int index) {
    setState(() {
      tarefas[index]["lembrete"] = !tarefas[index]["lembrete"];
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
          "Coragem e superação de medos",
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
                    value: feitas / total,
                    backgroundColor: Colors.grey[300],
                    color: Colors.green,
                    minHeight: 10,
                  ),
                ),
              if (feitas >= 7)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                child: Text("Estrelas: ${"⭐" * estrelas}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ],
      ),
    );
  }
}