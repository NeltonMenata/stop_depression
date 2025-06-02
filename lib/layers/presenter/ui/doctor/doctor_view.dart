import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class PsychologistProfilePage extends StatefulWidget {
  const PsychologistProfilePage({super.key});

  @override
  _PsychologistProfilePageState createState() =>
      _PsychologistProfilePageState();
}

enum Dia { dia1, dia2 }

enum Hora { hora1, hora2 }

class _PsychologistProfilePageState extends State<PsychologistProfilePage> {
  Dia? _opcaoDia = Dia.dia1;
  Hora? _opcaoHora = Hora.hora1;

  String diaSelecionado = "";
  String horaSelecionado = "";

  String selectedNote = '';
  bool isPrivate = false;
  String feedback = '';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isOnline = true;

  Future<void> enviarPedido(String body, String dia, String hora) async {
    final user = await ParseUser.currentUser() as ParseUser;
    final Email email = Email(
      body: body,
      subject:
          'Solicitação de sessão - ${user.get("name")} - Dia: $dia - Hora: $hora',
      recipients: ['winniealmeida65@gmail.com'],
      
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (date != null) setState(() => selectedDate = date);
  }

  void _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) setState(() => selectedTime = time);
  }

  void _scheduleSession() {
    if (selectedDate != null && selectedTime != null) {
      // Lógica para integração com Zoom ou chamada de vídeo aqui
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Sessão agendada para $selectedDate às ${selectedTime!.format(context)}.")),
      );

      // Simula lembrete push
      // Em produção, integre com Firebase Cloud Messaging (FCM)
      print("Push agendado: lembrete de sessão!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Perfil do Psicólogo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
          CircleAvatar(
            radius: 70,
            
            child: ClipOval(
                //borderRadius: BorderRadius.circular(100),
                //backgroundImage:AssetImage("assets/images/foto_perfil.jpeg",),
                    
                child: Image.asset("assets/images/foto_perfil.jpeg", fit: BoxFit.fitWidth,),//Text("WD", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),), // Coloque uma imagem local ou via rede
              ),
          ),
            const SizedBox(height: 10),
            const Text("Dra. Winnie de Almeida",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("Naturalidade: Luanda"),
            const Text("Local de Trabalho: ITEL"),
            const Text("Formação: UCAN"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Solicitação de sessão',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Divider(),
           
            const Text(
              'Selecione um dia:',
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Sábado'),
              leading: Radio<Dia>(
                value: Dia.dia1,
                groupValue: _opcaoDia,
                onChanged: (Dia? value) {
                  setState(() {
                    _opcaoDia = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Quarta Feira'),
              leading: Radio<Dia>(
                value: Dia.dia2,
                groupValue: _opcaoDia,
                onChanged: (Dia? value) {
                  setState(() {
                    _opcaoDia = value;
                  });
                },
              ),
            ),
            const Text(
              'Selecione uma hora:',
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('11h : 30'),
              leading: Radio<Hora>(
                value: Hora.hora1,
                groupValue: _opcaoHora,
                onChanged: (Hora? value) {
                  setState(() {
                    _opcaoHora = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('14h : 30'),
              leading: Radio<Hora>(
                value: Hora.hora2,
                groupValue: _opcaoHora,
                onChanged: (Hora? value) {
                  setState(() {
                    _opcaoHora = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20.0),

            const Text("Descrição", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration:
                  const InputDecoration(hintText: "Descreva aqui a sua situação..."),
              onChanged: (val) => feedback = val,
              maxLines: 3,
            ),
            ElevatedButton(
              onPressed: () async {
                switch (_opcaoDia!) {
                  case Dia.dia1:
                    diaSelecionado = "Sábado";

                  case Dia.dia2:
                    diaSelecionado = "Quarta feira";
                }

                switch (_opcaoHora!) {
                  case Hora.hora1:
                    horaSelecionado = "11h : 30";

                  case Hora.hora2:
                    horaSelecionado = "14h : 30";
                }
                await enviarPedido(feedback, diaSelecionado, horaSelecionado);
               },
              child: const Text("Enviar Pedido"),
            )
          ],
        ),
      ),
    );
  }
}
