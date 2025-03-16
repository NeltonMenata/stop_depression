import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_model.dart';

class TestComponent extends StatefulWidget {
  TestComponent(this.test,{super.key, required this.action, });

  final TestModel test;
  final VoidCallback action;

  //final listOption = ["Opção 1", "Opção 2", "Opção 3", "Opção 4"];

  @override
  State<TestComponent> createState() => _TestComponentState();
}

class _TestComponentState extends State<TestComponent> {
  String currentOption = "";

  @override
  void initState() {
    //currentOption = widget.test.option1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        ListTile(
          title: Text(widget.test.option1),
          leading: Radio(
              value: widget.test.option1,
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  widget.test.setValue(0);
                  currentOption = value.toString();
                  widget.action();
                });
              }),
        ),
        ListTile(
          title: Text(widget.test.option2),
          leading: Radio(
              value: widget.test.option2,
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  widget.test.setValue(1);
                  currentOption = value.toString();
                  widget.action();
                });
              }),
        ),
        ListTile(
          title: Text(widget.test.option3),
          leading: Radio(
              value: widget.test.option3,
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  widget.test.setValue(2);
                  currentOption = value.toString();
                  widget.action();
                });
              }),
        ),
        ListTile(
          title: Text(widget.test.option4),
          leading: Radio(
              value: widget.test.option4,
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  widget.test.setValue(3);
                  currentOption = value.toString();
                  widget.action();
                });
              }),
        ),
      ],
    );
  }
}