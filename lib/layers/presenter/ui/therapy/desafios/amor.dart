import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:stop_depression/layers/presenter/utils/utils.dart';

class AmorPage extends StatefulWidget {
  @override
  _AmorPageState createState() => _AmorPageState();
}

class _AmorPageState extends State<AmorPage> {
  List<Map<String, dynamic>> tarefas = [];

  final List<String> desafios = [
    "Não termine o dia de hoje sem elogiar alguém.",
    "Saia de casa vestindo algo que você ama, sem se preocupar com o que os outros vão pensar.",
    "Escreva em um papel três qualidades suas e leia em voz alta para si mesma.",
    "Aceite um elogio sem rebater ou diminuir. Só diga: “obrigada.”",
    "Tire um tempo para dançar ao som de uma música que você ama.",
    "Diga “não” para algo que você realmente não quer fazer, sem culpa.",
    "Olhe-se no espelho por 1 minuto e tente encontrar algo bonito em você.",
    "Comece o dia ouvindo uma música animada e cantando junto.",
    "Faça um elogio para si mesma na frente do espelho. Em voz alta.",
    "Escreva uma carta para você mesma de 5 anos atrás, com amor e encorajamento.",
    "Escreva uma carta para seu \"eu\" do futuro, com incentivo e metas.",
    "Pratique o autocuidado hoje: cuide do corpo, da mente ou da aparência.",
    "Relembre um momento em que você se sentiu poderosa e confiante.",
    "Vista-se para você mesma hoje. Escolha algo que te faça sentir bem.",
    "Faça uma lista de conquistas pessoais das quais você se orgulha.",
    "Tire uma selfie sorrindo e poste com uma legenda positiva sobre você.",
    "Compre ou prepare algo especial só para você hoje.",
    "Pratique um hobby ou algo que você ama sem culpa.",
    "Escreva 10 motivos pelos quais você merece amor e respeito.",
    "Olhe fotos antigas e reconheça o quanto você cresceu.",
    "Escolha uma frase de afirmação positiva e repita 5 vezes hoje.",
    "Dê-se um presente hoje, mesmo que seja simples.",
    "Faça algo que te deixe orgulhosa — mesmo que seja pequeno.",
  ];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tarefasSalvas = prefs.getString('amor');
    if (tarefasSalvas != null) {
      setState(() {
        tarefas = List<Map<String, dynamic>>.from(jsonDecode(tarefasSalvas));
      });
    }
  }

  Future<void> salvarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('amor', jsonEncode(tarefas));
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
          "Amor próprio e autoestima",
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