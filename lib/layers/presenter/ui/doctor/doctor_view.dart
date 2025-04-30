import 'package:flutter/material.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {
  @override
  Widget build(BuildContext context) {
    return PerfilPsicologoScreen();
  }
}

class PerfilPsicologoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil da Psicóloga'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto de Perfil
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://example.com/foto_perfil_winnie.jpg', // Troque pelo link real da foto
              ),
            ),
            SizedBox(height: 20),

            // Nome
            Text(
              "Winnie Almeida",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Informações detalhadas
            InfoItem(titulo: "Data de Nascimento", descricao: "11 de Janeiro de 1998"),
            InfoItem(titulo: "Naturalidade", descricao: "Luanda"),
            InfoItem(titulo: "Formação", descricao: "Licenciada em Psicologia pela Universidade Católica de Angola (UCA), em 2015"),
            InfoItem(titulo: "Local de Trabalho", descricao: "Hospital Geral de Luanda como médica psicóloga"),
          ],
        ),
      ),
    );
  }
}

// Widget para mostrar cada informação
class InfoItem extends StatelessWidget {
  final String titulo;
  final String descricao;

  const InfoItem({required this.titulo, required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            descricao,
            style: TextStyle(fontSize: 16),
          ),
          Divider(height: 20, thickness: 1),
        ],
      ),
    );
  }
}