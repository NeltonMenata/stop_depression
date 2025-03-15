import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

final listOption = ["Opção 1", "Opção 2", "Opção 3", "Opção 4"];

class _TestViewState extends State<TestView> {
  String currentOption = listOption[0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Testes"),
        ListTile(
          title: Text("Opção 1"),
          leading: Radio(
              value: listOption[0],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              }),
        ),
        ListTile(
          title: Text("Opção 2"),
          leading: Radio(
              value: listOption[1],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              }),
        ),
        ListTile(
          title: Text("Opção 3"),
          leading: Radio(
              value: listOption[2],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              }),
        ),
        ListTile(
          title: Text("Opção 4"),
          leading: Radio(
              value: listOption[3],
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              }),
        ),
      ],
    );
  }
}
