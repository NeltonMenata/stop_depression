import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stop_depression/layers/presenter/ui/therapy/desafios/amor.dart';
import 'package:stop_depression/layers/presenter/ui/therapy/desafios/autoavaliacao.dart';
import 'package:stop_depression/layers/presenter/ui/therapy/desafios/coragem.dart';
import 'package:stop_depression/layers/presenter/ui/therapy/desafios/gratidao.dart';
import 'dart:convert';
import 'package:stop_depression/layers/presenter/utils/utils.dart';

class OrganizarODia extends StatefulWidget {
  const OrganizarODia({super.key});

  @override
  _OrganizarODiaState createState() => _OrganizarODiaState();
}

class _OrganizarODiaState extends State<OrganizarODia> {
  List<Map<String, dynamic>> tarefas = [];

  final List<String> desafios = [
    "Não termine o dia de hoje sem elogiar alguém.",
    "Sorria para três pessoas desconhecidas hoje.",
    "Saia de casa vestindo algo que você ama, sem se preocupar com o que os outros vão pensar.",
    "Escreva em um papel três qualidades suas e leia em voz alta para si mesma.",
    "Faça algo que você sempre teve vontade, mas ficou com vergonha.",
    "Passe 15 minutos desconectada de tudo e apenas observe o que há ao seu redor.",
    "Mande uma mensagem para alguém que você gosta, só para dizer isso.",
    "Anote um medo que você tem e pense em um passo pequeno que pode dar em direção a enfrentá-lo.",
    "Aceite um elogio sem rebater ou diminuir. Só diga: “obrigada.”",
    "Escreva sobre um momento difícil que você superou. Relembre sua força.",
    "Passe um tempo com alguém que te faz rir.",
    "Fique 1 dia sem reclamar. Se pegar reclamando, tente reformular a frase.",
    "Faça algo gentil por alguém sem esperar nada em troca.",
    "Enfrente um pequeno medo hoje: fale em público, poste uma foto, tente algo novo.",
    "Tire um tempo para dançar ao som de uma música que você ama.",
    "Agradeça por 5 coisas hoje, por mais simples que sejam.",
    "Escreva uma carta para você mesma de 5 anos atrás, com amor e encorajamento.",
    "Caminhe por um lugar diferente hoje, mesmo que só mude o caminho habitual.",
    "Faça uma atividade fora da rotina: pinte, desenhe, escreva poesia, fotografe.",
    "Desafie um pensamento negativo com uma resposta positiva e realista.",
    "Tome uma decisão sem pedir opinião de ninguém. Confie em si mesma.",
    "Diga “não” para algo que você realmente não quer fazer, sem culpa.",
    "Olhe-se no espelho por 1 minuto e tente encontrar algo bonito em você.",
    "Comece o dia ouvindo uma música animada e cantando junto.",
    "Faça um elogio para si mesma na frente do espelho. Em voz alta.",
    "Converse com alguém que você não fala há um tempo. Reconectar é cura.",
    "Tire 10 minutos para respirar profundamente e fazer um check-in emocional.",
    "Faça uma lista das coisas que te dão medo — depois, marque as que você já enfrentou.",
    "Encontre um motivo para sorrir hoje, mesmo que seja pequeno.",
    "Escreva o que você aprendeu com esses desafios e o que sentiu ao longo do caminho."
  ];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tarefasSalvas = prefs.getString('desafios');
    if (tarefasSalvas != null) {
      setState(() {
        tarefas = List<Map<String, dynamic>>.from(jsonDecode(tarefasSalvas));
      });
    }
  }

  Future<void> salvarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('desafios', jsonEncode(tarefas));
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
    //String dataHoje = DateFormat("EEE, dd/MM/yy", 'pt_BR').format(DateTime.now());
    int feitas = tarefas.where((t) => t["feito"]).length;
    int total = tarefas.length;
    int estrelas = contarEstrelas();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenLight,
        title: const Text(
          "Desafios do bem",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: 
      ListView(
            //mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20,),
              GestureDetector(
              child: Image.asset("assets/images/gratidao.jpeg"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GratidaoPage()));
              },
            ),
            GestureDetector(
              child: Image.asset("assets/images/coragem.jpeg"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CoragemPage()));
              },
            ),
            GestureDetector(
              child: Image.asset("assets/images/amor.jpeg"),
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AmorPage()));
              },
            ),
            GestureDetector(
              child: Image.asset("assets/images/autoavaliacao.jpeg"),
            onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AutoavaliacaoPage()));
              },
            ),
          ],)
      // Stack(
      //   children: [
      //     // Column(
      //     //   children: [
      //     //     const SizedBox(height: 16),
      //     //     if (feitas >= 7)
      //     //       Padding(
      //     //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //     //         child: LinearProgressIndicator(
      //     //           value: feitas / total,
      //     //           backgroundColor: Colors.grey[300],
      //     //           color: Colors.green,
      //     //           minHeight: 10,
      //     //         ),
      //     //       ),
      //     //     if (feitas >= 7)
      //     //       Padding(
      //     //         padding:
      //     //             const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      //     //         child: Align(
      //     //           alignment: Alignment.centerLeft,
      //     //           child: Text(
      //     //               "Você completou $feitas de $total desafios, continue assim!",
      //     //               style: const TextStyle(
      //     //                   fontSize: 14, color: Colors.black87)),
      //     //         ),
      //     //       ),
      //     //     Expanded(
      //     //       child: ListView.builder(
      //     //         itemCount: tarefas.length,
      //     //         itemBuilder: (context, index) {
      //     //           final tarefa = tarefas[index];
      //     //           return Padding(
      //     //             padding: const EdgeInsets.symmetric(
      //     //                 horizontal: 20, vertical: 8),
      //     //             child: Row(
      //     //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     //               children: [
      //     //                 Expanded(
      //     //                   child: Container(
      //     //                     padding: const EdgeInsets.symmetric(
      //     //                         horizontal: 16, vertical: 12),
      //     //                     decoration: BoxDecoration(
      //     //                       color: Colors.cyan[700],
      //     //                       borderRadius: BorderRadius.circular(30),
      //     //                     ),
      //     //                     child: Text(
      //     //                       tarefa["titulo"],
      //     //                       style: const TextStyle(
      //     //                           color: Colors.black87, fontSize: 16),
      //     //                     ),
      //     //                   ),
      //     //                 ),
      //     //                 const SizedBox(width: 10),
      //     //                 // GestureDetector(
      //     //                 //   onTap: () => alternarLembrete(index),
      //     //                 //   child: Icon(
      //     //                 //     Icons.notifications,
      //     //                 //     //color: tarefa["lembrete"]
      //     //                 //       color: Colors.grey
      //     //                 //        // : Colors.black87,
      //     //                 //   ),
      //     //                 // ),
      //     //                 const SizedBox(width: 10),
      //     //                 GestureDetector(
      //     //                   onTap: () => marcarComoFeita(index),
      //     //                   child: CircleAvatar(
      //     //                     backgroundColor: tarefa["feito"]
      //     //                         ? Colors.green
      //     //                         : Colors.grey[800],
      //     //                     child:
      //     //                         const Icon(Icons.check, color: Colors.white),
      //     //                   ),
      //     //                 ),
      //     //               ],
      //     //             ),
      //     //           );
      //     //         },
      //     //       ),
      //     //     ),
      //     //     Padding(
      //     //       padding:
      //     //           const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //     //       child: ElevatedButton(
      //     //         onPressed: adicionarTarefa,
      //     //         style: ElevatedButton.styleFrom(
      //     //           backgroundColor: Colors.cyan,
      //     //           shape: RoundedRectangleBorder(
      //     //             borderRadius: BorderRadius.circular(30),
      //     //           ),
      //     //           padding: const EdgeInsets.symmetric(vertical: 12),
      //     //         ),
      //     //         child: const Center(
      //     //           child: Text(
      //     //             "Próximo desafio",
      //     //             style: TextStyle(fontSize: 16, color: Colors.black),
      //     //           ),
      //     //         ),
      //     //       ),
      //     //     ),
      //     //     Padding(
      //     //       padding: const EdgeInsets.only(right: 20, bottom: 10),
      //     //       child: Align(
      //     //         alignment: Alignment.bottomRight,
      //     //         child: Text(
      //     //           DateTime.now().toIso8601String().substring(0, 10),
      //     //           style: TextStyle(fontSize: 14, color: Colors.grey[700]),
      //     //         ),
      //     //       ),
      //     //     ),
      //     //     Padding(
      //     //       padding: const EdgeInsets.only(bottom: 10),
      //     //       child: Text("Estrelas: ${"⭐" * estrelas}",
      //     //           style: const TextStyle(
      //     //               fontSize: 18,
      //     //               color: Colors.amber,
      //     //               fontWeight: FontWeight.bold)),
      //     //     ),
      //     //     const SizedBox(height: 60),
      //     //   ],
      //     // ),

          
      //   ],
      // ),
    );
  }
}
