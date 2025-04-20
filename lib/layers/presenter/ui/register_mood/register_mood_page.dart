import 'package:flutter/material.dart';

class RegisterMood extends StatefulWidget {
  @override
  _RegisterMoodState createState() => _RegisterMoodState();
}

class _RegisterMoodState extends State<RegisterMood> {
  int selectedMood = -1;
  String description = '';
  DateTime selectedDate = DateTime.now();

  final TextEditingController descriptionController = TextEditingController();

  final List<Map<String, dynamic>> moods = [
    {"emoji": "😁", "label": "Muito bem", "color": Colors.green[800]},
    {"emoji": "🙂", "label": "Bem", "color": Colors.lightGreen},
    {"emoji": "😐", "label": "Mais ou menos", "color": Colors.yellow},
    {"emoji": "🙁", "label": "Mal", "color": Colors.orange},
    {"emoji": "😠", "label": "Muito mal", "color": Colors.red},
  ];

  void selectMood(int index) {
    setState(() {
      selectedMood = index;
    });
  }

  // String formatDate(DateTime date) {
  //   final formatter = DateFormat("E',' dd/MM/yy", 'pt_BR');
  //   return formatter.format(date);
  // }

  void saveMood() {
    if (selectedMood != -1) {
      final mood = moods[selectedMood]["label"];
      final moodEmoji = moods[selectedMood]["emoji"];
      final moodColor = moods[selectedMood]["color"];
      final moodDescription = descriptionController.text.trim();
      //final moodDate = formatDate(selectedDate);

      // Aqui você pode salvar os dados no banco (Firebase, SQLite, etc.)
      print("Humor: $mood ($moodEmoji)");
      print("Descrição: $moodDescription");
      //print("Data: $moodDate");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Humor registrado com sucesso!")),
      );

      // Limpar campos (opcional)
      setState(() {
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
        title: Text("Registo de Humor"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Como te sentes hoje?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
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
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Como foi o seu dia?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 150,
              child: TextField(
                controller: descriptionController,
                maxLines: 3,
                style: TextStyle(color: Colors.grey.shade800),
                decoration: InputDecoration(
                  hintText: "Descrever",
                  filled: true,
                  
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: saveMood,
                icon: Icon(Icons.check_circle, color: Colors.white,),
                label: Text("Salvar", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  DateTime.now().toIso8601String().substring(0, 10),
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}