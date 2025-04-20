import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_view.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 152, 187),
        title: const Text("Teste Becky"),
        centerTitle: true,
      ),
      body: const TestView(),
    );
  }
}