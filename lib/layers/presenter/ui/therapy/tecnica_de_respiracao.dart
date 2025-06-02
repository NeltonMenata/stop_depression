import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/utils/utils.dart';

class BreathingExercise extends StatefulWidget {
  const BreathingExercise({super.key});

  @override
  _BreathingExerciseState createState() => _BreathingExerciseState();
}

class _BreathingExerciseState extends State<BreathingExercise> {
  double size = 100;
  String instruction = "Prepare-se";
  int time = 0;
  int phase = 0; // 0 = Segure, 1 = Inspire, 2 = Expire

  void startExercise() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        time += 5;
        if (phase == 0) {
          instruction = "Inspire";
          size = 200;
          phase = 1;
        } else if (phase == 1) {
          instruction = "Expire";
          size = 100;
          phase = 2;
        } else {
          instruction = "Segure";
          phase = 0;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), startExercise);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Respiração"), backgroundColor: greenLight,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Tempo: ${time.toString().padLeft(2, '0')}:00",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            AnimatedContainer(
              duration: const Duration(seconds: 5),
              width: size,
              height: size,
              decoration:
                  const BoxDecoration(color: greenDark, shape: BoxShape.circle),
            ),
            const SizedBox(height: 20),
            Text(instruction, style: const TextStyle(fontSize: 24))
          ],
        ),
      ),
    );
  }
}
