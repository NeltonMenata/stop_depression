import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';

class TestDesc2Page extends StatelessWidget {
  const TestDesc2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teste de Becky"),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "O Teste de Becky (Inventário de Depressão de Beck - BDI) é um questionário com 21 perguntas, cada uma com quatro alternativas, representando diferentes niveis de sintomas depressivos.",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Center(
            child: const Text(
              "Passo a Passo: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ).animate(onComplete: (c) => c.repeat()).scale(
                  duration: const Duration(seconds: 1),
                  begin: const Offset(.8, .8),
                  end: const Offset(
                    1.2,
                    1.2,
                  ),
                ),
          ),
          const ListTile(
            title: Text(
              "Leia atentamente as perguntas, só assim responda a cada uma das 21 questões, escolhendo a alternativa que melhor descreve como se sentiu na última semana.",
              style: TextStyle(fontSize: 18),
            ),
            leading: Chip(
              backgroundColor: Colors.blue,
              label: Text(
                "1",
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.all(2),
            ),
          ),
          const ListTile(
            title: Text(
              "Cada resposta tem uma pontuação de 0 a 3, indicando a gravidade dos sintomas.",
              style: TextStyle(fontSize: 18),
            ),
            leading: Chip(
              label: Text(
                "2",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
              padding: EdgeInsets.all(2),
            ),
          ),
          const ListTile(
            title: Text(
              "No final, todas as respostas são somadas.",
              style: TextStyle(fontSize: 18),
            ),
            leading: Chip(
              padding: EdgeInsets.all(2),
              backgroundColor: Colors.blue,
              label: Text(
                "3",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Análise do Resultado - A pontuação final indica o nível de depressão:",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            //color: Colors.black,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(15)
              ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "0 a 13: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Melancolia",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  )
                ]),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "14 a 19: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Depressão leve",
                    style: TextStyle(fontSize: 18, color: Colors.yellow),
                  )
                ]),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "20 a 28: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Depressão moderada",
                    style: TextStyle(fontSize: 18, color: Colors.orange),
                  )
                ]),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "29 a 63: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Depressão grave",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  )
                ]),
          ),
            ],),
          ),
          
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Com base no resultado, um psicólogo pode sugerir acompanhamento ou tratamento adequado.\nO teste não substitui um diagnóstico clínico, mas é um indicativo inicial do estado emocional do paciente.",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.TEST);
                      },
                      child: const Text(
                        "Fazer teste",
                        style: TextStyle(color: Colors.white),
                      )).animate(onComplete: (c) => c.repeat()).scale(
                    duration: const Duration(seconds: 1),
                    begin: const Offset(.8, .8),
                    end: const Offset(
                      1.2,
                      1.2,
                    ),
                  ),
            ),
          )
        ]),
      ),
    );
  }
}
