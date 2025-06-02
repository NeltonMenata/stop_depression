import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:stop_depression/layers/presenter/utils/utils.dart';

class GratidaoPage extends StatefulWidget {
  @override
  _GratidaoPageState createState() => _GratidaoPageState();
}

class _GratidaoPageState extends State<GratidaoPage> {
  List<Map<String, dynamic>> tarefas = [];

  final List<String> desafios = [
    "Sorria para três pessoas desconhecidas hoje.",
    "Passe 15 minutos desconectada de tudo e apenas observe o que há ao seu redor.",
    "Mande uma mensagem para alguém que você gosta, só para dizer isso.",
    "Passe um tempo com alguém que te faz rir.",
    "Fique 1 dia sem reclamar. Se pegar reclamando, tente reformular a frase.",
    "Faça algo gentil por alguém sem esperar nada em troca.",
    "Agradeça por 5 coisas hoje, por mais simples que sejam.",
    "Caminhe por um lugar diferente hoje, mesmo que só mude o caminho habitual.",
    "Encontre um motivo para sorrir hoje, mesmo que seja pequeno.",
    "Deixe um bilhete positivo para alguém encontrar.",
    "Compartilhe uma boa notícia com alguém.",
    "Agradeça em voz alta por algo hoje.",
    "Escreva uma lista de pequenas alegrias da sua rotina.",
    "Ofereça ajuda para alguém, mesmo que pequena.",
    "Comemore uma conquista, mesmo que pequena.",
    "Dê bom dia para alguém com um sorriso sincero.",
    "Reconheça um privilégio que você tem e valorize.",
    "Deseje sinceramente o bem a alguém que te irritou.",
    "Compartilhe uma lembrança feliz com alguém.",
    "Faça alguém rir hoje.",
    "Escreva 5 bênçãos que você tem e esquece de agradecer.",
    "Agradeça a si mesma por não desistir.",
  ];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tarefasSalvas = prefs.getString('gratidao');
    if (tarefasSalvas != null) {
      setState(() {
        tarefas = List<Map<String, dynamic>>.from(jsonDecode(tarefasSalvas));
      });
    }
  }

  Future<void> salvarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('gratidao', jsonEncode(tarefas));
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
          "Gratidão e positividade",
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