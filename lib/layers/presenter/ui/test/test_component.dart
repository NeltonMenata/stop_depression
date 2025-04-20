import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_model.dart';

class TestComponent extends StatefulWidget {
  TestComponent(
    this.test, {
    super.key,
    required this.action,
  });

  final TestModel test;
  final VoidCallback action;

  //final listOption = ["Opção 1", "Opção 2", "Opção 3", "Opção 4"];

  @override
  State<TestComponent> createState() => _TestComponentState();
}

class _TestComponentState extends State<TestComponent>
    with SingleTickerProviderStateMixin {
  String currentOption = "";

  late AnimationController animationController;

  final animateNotifier = ValueNotifier(false);

  @override
  void initState() {
    //currentOption = widget.test.option1;
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: animateNotifier,
        builder: (context, value, _) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      onPressed: () {
                        animateNotifier.value = !animateNotifier.value;
                        setState(() {
                          widget.test.setValue(0);
                          widget.action();
                        });
                      },
                      child: Text(
                        widget.test.option1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
                    .animate()
                    .moveX(begin: 50, end: 0, duration: 1500.ms)
                    .then()
                    .moveX(begin: -50, end: 0)
                    .animate(
                      target: animateNotifier.value ? 1 : 0,
                      onPlay: (controller) {
                        //controller.reverse();
                      },
                    )
                    .moveX(begin: 50, end: 0, duration: 1500.ms)
                    //.hide()
                    .then()
                    //.show(maintain: false)
                    .moveX(begin: -50, end: 0),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                      ),
                      onPressed: () {
                        animateNotifier.value = !animateNotifier.value;
                        setState(() {
                          widget.test.setValue(1);
                          widget.action();
                        });
                      },
                      child: Text(
                        widget.test.option2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )                    .animate()
                    .moveX(begin: -50, end: 0, duration: 1500.ms)
                    .then()
                    .moveX(begin: 50, end: 0)
                    .animate(
                      target: animateNotifier.value ? 1 : 0,
                      onPlay: (controller) {
                        //controller.reverse();
                      },
                    )
                    .moveX(begin: -50, end: 0, duration: 1500.ms)
                    //.hide()
                    .then()
                    //.show(maintain: false)
                    .moveX(begin: 50, end: 0),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                      ),
                      onPressed: () {
                        animateNotifier.value = !animateNotifier.value;
                        setState(() {
                          widget.test.setValue(2);
                          widget.action();
                        });
                      },
                      child: Text(
                        widget.test.option3,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
                                        .animate()
                    .moveX(begin: 50, end: 0, duration: 1500.ms)
                    .then()
                    .moveX(begin: -50, end: 0).animate(
                      target: animateNotifier.value ? 1 : 0,
                      onPlay: (controller) {
                        //controller.reverse();
                      },
                    )
                    .moveX(begin: 50, end: 0, duration: 1500.ms)
                    //.hide()
                    .then()
                    //.show(maintain: false)
                    .moveX(begin: -50, end: 0),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        animateNotifier.value = !animateNotifier.value;
                        setState(() {
                          widget.test.setValue(3);
                          widget.action();
                        });
                      },
                      child: Text(
                        widget.test.option4,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )                    .animate()
                    .moveX(begin: -50, end: 0, duration: 1500.ms)
                    .then()
                    .moveX(begin: 50, end: 0)
                    .animate(
                      target: animateNotifier.value ? 1 : 0,
                      onPlay: (controller) {
                        //controller.reverse();
                      },
                    )
                    .moveX(begin: -50, end: 0, duration: 1500.ms)
                    //.hide()
                    .then()
                    //.show(maintain: false)
                    .moveX(begin: 50, end: 0),
              ],
            ),
          );
        });
  }
}
