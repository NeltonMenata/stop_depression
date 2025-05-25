import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:stop_depression/layers/presenter/utils/utils.dart';

class RegisterMood extends StatefulWidget {
  @override
  _RegisterMoodState createState() => _RegisterMoodState();
}

class _RegisterMoodState extends State<RegisterMood> {
  int selectedMood = -1;
  String description = '';
  int setIndex = -1;
  DateTime selectedDate = DateTime.now();
  bool isSave = false;

  final TextEditingController descriptionController = TextEditingController();

  final List<Map<String, dynamic>> moods = [
    {"emoji": "😁", "label": "Muito bem", "color": Colors.green[800]},
    {"emoji": "🙂", "label": "Bem", "color": Colors.lightGreen},
    {"emoji": "😐", "label": "Mais ou menos", "color": Colors.yellow},
    {"emoji": "🙁", "label": "Mal", "color": Colors.orange},
    {"emoji": "😠", "label": "Muito mal", "color": Colors.red},
  ];

  void selectMood(int index) {
    setIndex = index;
    setState(() {
      selectedMood = index;
    });
  }

  // String formatDate(DateTime date) {
  //   final formatter = DateFormat("E',' dd/MM/yy", 'pt_BR');
  //   return formatter.format(date);
  // }

  Future<List<ParseObject>>? getMood() async {
    final user = await ParseUser.currentUser() as ParseUser;
    final mood = QueryBuilder(ParseObject("Humor"));
    mood.whereEqualTo("user", user);
    final response = await mood.find();
    return response;
  }

  Future<void> saveMood(int index) async {
    if (selectedMood == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Selecione um emoji de como te sentes hoje!")),
      );
      return;
    }

    if (descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Escreva uma descrição de como foi o seu dia hoje!")),
      );
      return;
    }
    setState(() {
      isSave = true;
    });
    final user = await ParseUser.currentUser() as ParseUser;
    if (selectedMood != -1) {
      final humor = ParseObject("Humor");
      humor.set("title", moods[index]["label"]);
      humor.set("emoji", moods[index]["emoji"]);
      humor.set("user", user);
      humor.set("describe", descriptionController.text);
      await humor.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Humor registrado com sucesso!")),
      );

      // Limpar campos (opcional)
      setState(() {
        isSave = false;
        selectedMood = -1;
        descriptionController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //final formattedDate = formatDate(selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registo de Humor",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: greenLight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Como te sentes hoje?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(moods.length, (index) {
                return GestureDetector(
                  onTap: () => selectMood(index),
                  child: Column(
                    children: [
                      Text(
                        moods[index]["emoji"],
                        style: TextStyle(
                          fontSize: 36,
                          color: selectedMood == index
                              ? moods[index]["color"]
                              : Colors.grey[700],
                        ),
                      ),
                      if (selectedMood == index)
                        Text(
                          moods[index]["label"],
                          style: TextStyle(
                            color: moods[index]["color"],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Como foi o seu dia?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 150,
              child: TextField(
                controller: descriptionController,
                maxLines: 3,
                style: TextStyle(color: Colors.grey.shade800),
                decoration: InputDecoration(
                  hintText: "Descrever",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            
            isSave
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton.icon(
                    onPressed: () => saveMood(setIndex),
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<ParseObject>>(
                  future: getMood(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                              snapshot.data?.length ?? 0,
                              (index) => ListTile(
                                    leading: Text(
                                      snapshot.data?[index].get(
                                        "emoji",
                                      ),
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    title: Text(
                                        snapshot.data?[index].get("title")),
                                    subtitle: Text(
                                        snapshot.data?[index].get("describe")),
                                    trailing: Text(
                                        "${snapshot.data?[index].createdAt!.toIso8601String().substring(0, 10)}"),
                                  )),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Houve um erro: ${snapshot.error}");
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  })),
            )
          ],
        ),
      ),
    );
  }
}
