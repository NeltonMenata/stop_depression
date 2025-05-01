// import 'package:flutter/material.dart';

// class DoctorView extends StatefulWidget {
//   const DoctorView({super.key});

//   @override
//   State<DoctorView> createState() => _DoctorViewState();
// }

// class _DoctorViewState extends State<DoctorView> {
//   @override
//   Widget build(BuildContext context) {
//     return PerfilPsicologoScreen();
//   }
// }

// class PerfilPsicologoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Perfil da Psicóloga'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Foto de Perfil
//             CircleAvatar(
//               radius: 60,
//               backgroundImage: NetworkImage(
//                 'https://example.com/foto_perfil_winnie.jpg', // Troque pelo link real da foto
//               ),
//             ),
//             SizedBox(height: 20),

//             // Nome
//             Text(
//               "Winnie Almeida",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),

//             // Informações detalhadas
//             InfoItem(titulo: "Data de Nascimento", descricao: "11 de Janeiro de 1998"),
//             InfoItem(titulo: "Naturalidade", descricao: "Luanda"),
//             InfoItem(titulo: "Formação", descricao: "Licenciada em Psicologia pela Universidade Católica de Angola (UCA), em 2015"),
//             InfoItem(titulo: "Local de Trabalho", descricao: "Hospital Geral de Luanda como médica psicóloga"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Widget para mostrar cada informação
// class InfoItem extends StatelessWidget {
//   final String titulo;
//   final String descricao;

//   const InfoItem({required this.titulo, required this.descricao});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             titulo,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           SizedBox(height: 4),
//           Text(
//             descricao,
//             style: TextStyle(fontSize: 16),
//           ),
//           Divider(height: 20, thickness: 1),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
class PsychologistProfilePage extends StatefulWidget {
  @override
  _PsychologistProfilePageState createState() => _PsychologistProfilePageState();
}

class _PsychologistProfilePageState extends State<PsychologistProfilePage> {
  String selectedNote = '';
  bool isPrivate = false;
  String feedback = '';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isOnline = true;

  void _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
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
        SnackBar(content: Text("Sessão agendada para $selectedDate às ${selectedTime!.format(context)}.")),
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
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/psicologo.jpg'), // Coloque uma imagem local ou via rede
            ),
            SizedBox(height: 10),
            Text("Dra. Winnie de Almeida", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Naturalidade: Luanda"),
            Text("Local de Trabalho: ITEL"),
            Text("Formação: UCAN"),
            Divider(),
            ListTile(
              title: Text("Agendamento de Sessão"),
              subtitle: Text("Escolha data e horário"),
              trailing: Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            if (selectedDate != null) Text("Data selecionada: ${selectedDate!.toLocal()}"),
            ElevatedButton(onPressed: _pickTime, child: Text("Escolher Horário")),
            if (selectedTime != null) Text("Horário: ${selectedTime!.format(context)}"),
            SwitchListTile(
              title: Text("Atendimento Online"),
              value: isOnline,
              onChanged: (val) => setState(() => isOnline = val),
            ),
            ElevatedButton(onPressed: _scheduleSession, child: Text("Agendar Sessão")),
            Divider(),
            TextField(
              decoration: InputDecoration(labelText: "Compartilhar Anotações"),
              onChanged: (val) => selectedNote = val,
            ),
            CheckboxListTile(
              title: Text("Marcar como privado"),
              value: isPrivate,
              onChanged: (val) => setState(() => isPrivate = val ?? false),
            ),
            Divider(),
            Text("Avaliação da Sessão", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(hintText: "Escreva seu feedback aqui..."),
              onChanged: (val) => feedback = val,
              maxLines: 3,
            ),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Feedback enviado!"))),
              child: Text("Enviar Avaliação"),
            )
          ],
        ),
      ),
    );
  }
}
