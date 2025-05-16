import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';

class TestDesc1Page extends StatelessWidget {
  const TestDesc1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Depressão"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Text(
            "Depressão",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
                "A depressão é um transtorno mental caracterizado por tristeza persistente, perda de interesse em atividades, fadiga, alterações no sono e apetite, dificuldade de concentração e, em casos mais graves, pensamentos suicidas. Ela pode ser causada por fatores genéticos, biológicos, psicológicos e socias.\nComo evitar a Depressão\nEmbora nem sempre seja possível prevenir a depressão, algumas atitudes podem ajudar a reduzir o risco:"),
          ),
          const ListTile(
            title: Text(
                "Estilo de vida saudável - Alimentação equilibrada, exercicios fisicos regulares e sono adequado."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text(
                "Gerenciamento do estresse - Técnicas como meditação, yoga e respiração profunda ajudam a controlar o estresse."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text(
                "Relacionamentos saudáveis - Manter contacto com amigos e familiares reduz a sensação de isolamento."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text(
                "Autoconhecimento e terapia - Buscar apoio profissional, como psicólogos e terapeutas, pode ajudar a lidar com emoções negativas."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text(
                "Atividades prazerosas - Hobbies e momentos de fazer são essencias para o bem estar mensal."),
            leading: Icon(Icons.check),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.TEST_DESC_2);
              },
              icon: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.square,
                    size: 12,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.square,
                    size: 12,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.forward_rounded,
                    color: Colors.blue,
                    size: 26,
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
