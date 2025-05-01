import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AgendaDiaria extends StatefulWidget {
  @override
  _AgendaDiariaState createState() => _AgendaDiariaState();
}

class _AgendaDiariaState extends State<AgendaDiaria> {
  List<Map<String, dynamic>> tarefas = []; // Lista de tarefas com título e status
  TextEditingController _controller = TextEditingController(); // Controlador do campo de texto

  @override
  void initState() {
    super.initState();
    carregarTarefas(); // Carrega as tarefas salvas ao iniciar
  }

  // Carrega as tarefas salvas usando SharedPreferences
  Future<void> carregarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dados = prefs.getString('tarefas');
    if (dados != null) {
      setState(() {
        tarefas = List<Map<String, dynamic>>.from(jsonDecode(dados));
      });
    }
  }

  // Salva a lista de tarefas no armazenamento local
  Future<void> salvarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('tarefas', jsonEncode(tarefas));
  }

  // Adiciona uma nova tarefa à lista
  void adicionarTarefa(String titulo) {
    setState(() {
      tarefas.add({"titulo": titulo, "feito": false}); // Nova tarefa começa como não feita
      salvarTarefas(); // Salva após adicionar
      _controller.clear(); // Limpa o campo de texto
    });
  }

  // Alterna o status de "feito" de uma tarefa
  void alternarFeito(int index) {
    setState(() {
      tarefas[index]['feito'] = !tarefas[index]['feito'];
      salvarTarefas(); // Salva após alterar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda Diária"),
        backgroundColor: Color.fromARGB(255, 15, 152, 187),
        //backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto e botão para adicionar nova tarefa
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: "Nova tarefa"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      adicionarTarefa(_controller.text.trim());
                    }
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            // Lista de tarefas
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefas[index];
                  return ListTile(
                    title: Text(
                      tarefa['titulo'],
                      style: TextStyle(
                        decoration: tarefa['feito']
                            ? TextDecoration.lineThrough // Riscado se feito
                            : TextDecoration.none,
                      ),
                    ),
                    leading: GestureDetector(
                      onTap: () => alternarFeito(index),
                      child: CircleAvatar(
                        backgroundColor:
                            tarefa['feito'] ? Colors.green : Colors.grey, // Verde se feito
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}