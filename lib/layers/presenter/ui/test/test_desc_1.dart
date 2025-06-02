import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';

class TestDesc1Page extends StatefulWidget {
  const TestDesc1Page({super.key});

  @override
  State<TestDesc1Page> createState() => _TestDesc1PageState();
}

class _TestDesc1PageState extends State<TestDesc1Page> {
  final AudioPlayer _narracaoPlayer = AudioPlayer();

  bool _isPlaying = false;

  Future<void> _togglePlay() async {
    if (_isPlaying) {
      await _narracaoPlayer.pause();
    } else {
      await _narracaoPlayer.setAsset("assets/audio/take.mp3");
      _narracaoPlayer.play();
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Depressão", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [IconButton(onPressed: _togglePlay, icon: const Icon(Icons.audiotrack),tooltip: "Reproduzir audio",)],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // const Text(
          //   "Depressão",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
            "Fale sobre isso. Cuidar da mente também é um ato de amor. A depressão é mais do que tristeza passageira. É um transtorno mental que se manifesta por meio de sentimentos persistentes de desânimo, perda de interesse pelas atividades do dia a dia, cansaço constante, alterações no sono e apetite, dificuldade de concentração e, em casos mais graves, pensamentos suicidas.\n\nEla pode surgir por diversos motivos — genéticos, emocionais, situações difíceis ou até mesmo o acúmulo de pressões silenciosas do cotidiano.\n\nE se eu estiver passando por isso? Saiba que você não está só. Aqui deste lado, existem pessoas prontas para te ouvir, apoiar e caminhar com você. Procurar ajuda não é sinal de fraqueza — é um ato de coragem e cuidado consigo mesmo.\n\nO que podes fazer para cuidar da sua saúde mental? Mesmo que não seja sempre possível evitar a depressão, algumas atitudes simples podem fortalecer sua mente e coração:", style: TextStyle(fontSize: 17),),
          ),
          const ListTile(
            title: Text(
                "Tenha um estilo de vida saudável – Coma bem, durma com qualidade e movimente o corpo. Seu cérebro agradece."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text(
                "Gerencie o estresse – Práticas como meditação, respiração consciente e yoga ajudam a aliviar tensões."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text(
                "Esteja com quem te faz bem – Conversar, rir e se sentir acolhido por amigos e familiares faz toda a diferença."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text(
                "Procure ajuda profissional – Psicólogos e terapeutas estão aqui para ajudar você a entender e lidar com o que está sentindo."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text(
                "Cultive o que te traz alegria – Um hobby, uma música, um momento de paz… o que te faz bem deve fazer parte da sua rotina."),
            leading: Icon(Icons.check),
          ),
          const ListTile(
            title: Text("Explore as terapias da nossa app – Cuidar da saúde mental pode ser leve e acessível. No nosso app, você encontra quatro terapias práticas pensadas para o seu bem-estar: técnicas de respiração, desafios emocionais, agenda diária e o registro de humor com emojis. Pequenas ações, todos os dias, que fazem uma grande diferença."),
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
