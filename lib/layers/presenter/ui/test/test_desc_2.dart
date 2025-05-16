import 'package:flutter/material.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
            "",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
                "O Teste de Becky (Inventário de Depressão de Beck - BDI) é um questionário com 21 perguntas, cada uma com quatro alternativas, representando diferentes niveis de sintomas depressivos."),
          ),
          const Center(child: Text("Passo a Passo: ", style: TextStyle(fontWeight: FontWeight.bold),)),
          const ListTile(
            title: Text(
                "Leia atentamente as perguntas, só assim responda a cada uma das 21 questões, escolhendo a alternativa que melhor descreve como se sentiu na última semana."),
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
                "Cada resposta tem uma pontuação de 0 a 3, indicando a gravidade dos sintomas."),
            leading: Chip(
              label: Text("2",
              style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
              padding: EdgeInsets.all(2),
            ),
          ),
          const ListTile(
            title: Text(
                "No final, todas as respostas são somadas."),
            leading: Chip(
              padding: EdgeInsets.all(2),
              backgroundColor: Colors.blue,
              label: Text("3",
              style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Análise do Resultado - A pontuação final indica o nível de depressão:"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
               Text("0 a 13: ", style: TextStyle(fontWeight: FontWeight.bold),), Text("Melancolia")
                ]
              
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
               Text("14 a 19: ", style: TextStyle(fontWeight: FontWeight.bold),), Text("Depressão leve")
                ]
              
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
               Text("20 a 28: ", style: TextStyle(fontWeight: FontWeight.bold),), Text("Depressão moderada")
                ]
              
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
               Text("29 a 63: ", style: TextStyle(fontWeight: FontWeight.bold),), Text("Depressão grave")
                ]
              
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Com base no resultado, um psicólogo pode sugerir acompanhamento ou tratamento adequado.\nO teste não substitui um diagnóstico clínico, mas é um indicativo inicial do estado emocional do paciente."),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.TEST);
                  },
                  child: const Text("Fazer teste",style: TextStyle(color: Colors.black),)),
            ),
          )
        ]),
      ),
    );
  }
}
