// import 'package:flutter/material.dart';
//import 'package:flutter_animate/flutter_animate.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_model.dart';
import 'package:flutter/material.dart';

class TestComponent extends StatefulWidget {
  const TestComponent(
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

  //final animateNotifier = ValueNotifier(false);

  @override
  void initState() {
    //currentOption = widget.test.option1;
    //animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              height: 100,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  //animateNotifier.value = !animateNotifier.value;
                  setState(() {
                    widget.test.setValue(0);
                    widget.action();
                  });
                },
                child: Text(
                  widget.test.option1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black),
                ),
              ),
            ),
          ),
              // .animate()
              // .moveX(begin: 50, end: 0, duration: 2000.ms)
              // .then()
              // .moveX(begin: -50, end: 0)
              // .animate(
              //   //target: animateNotifier.value ? 1 : 0,
              //   onPlay: (controller) {
              //     //controller.reverse();
              //   },
              // )
              // .moveX(begin: 50, end: 0, duration: 2000.ms)
              // //.hide()
              // .then()
              // //.show(maintain: false)
              // .moveX(begin: -50, end: 0),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.yellow),
                ),
                onPressed: () {
                  //animateNotifier.value = !animateNotifier.value;
                  setState(() {
                    widget.test.setValue(1);
                    widget.action();
                  });
                },
                child: Text(
                  widget.test.option2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black),
                ),
              ),
            ),
          ),    
          //                .animate()
          //     .moveX(begin: -50, end: 0, duration: 2000.ms)
          //     .then()
          //     .moveX(begin: 50, end: 0)
          //     .animate(
          //       //target: animateNotifier.value ? 1 : 0,
          //       onPlay: (controller) {
          //         //controller.reverse();
          //       },
          //     )
          //     .moveX(begin: -50, end: 0, duration: 2000.ms)
          //     //.hide()
          //     .then()
          //     //.show(maintain: false)
          //     .moveX(begin: 50, end: 0),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orange),
                ),
                onPressed: () {
                  //animateNotifier.value = !animateNotifier.value;
                  setState(() {
                    widget.test.setValue(2);
                    widget.action();
                  });
                },
                child: Text(
                  widget.test.option3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black),
                ),
              ),
            ),
          ),
              //                     .animate()
              // .moveX(begin: 50, end: 0, duration: 2000.ms)
              // .then()
              // .moveX(begin: -50, end: 0).animate(
              //   //target: animateNotifier.value ? 1 : 0,
              //   onPlay: (controller) {
              //     //controller.reverse();
              //   },
              // )
              // .moveX(begin: 50, end: 0, duration: 2000.ms)
              // //.hide()
              // .then()
              // //.show(maintain: false)
              // .moveX(begin: -50, end: 0),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  //animateNotifier.value = !animateNotifier.value;
                  setState(() {
                    widget.test.setValue(3);
                    widget.action();
                  });
                },
                child: Text(
                  widget.test.option4,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black),
                ),
              ),
            ),
          )             
              //    .animate()
              // .moveX(begin: -50, end: 0, duration: 2000.ms)
              // .then()
              // .moveX(begin: 50, end: 0)
              // .animate(
              //   //target: animateNotifier.value ? 1 : 0,
              //   onPlay: (controller) {
              //     //controller.reverse();
              //   },
              // )
              // .moveX(begin: -50, end: 0, duration: 2000.ms)
              // //.hide()
              // .then()
              // //.show(maintain: false)
              // .moveX(begin: 50, end: 0),
        ],
      ),
    );
  }
}


class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

int currentTest = 0;

class _TestViewState extends State<TestView> with TickerProviderStateMixin {
  int resultTest = 0;
  int indexMsg = 0;

  final listTest = [
    TestModel("Não me sinto triste", "Eu me sinto", "Estou sempre triste e não consigo sair disto", "Estou tão triste ou infeliz que não consigo suportar"),
    TestModel("Não estou especialmente desanimado quanto ao futuro", "Eu me sinto desanimado quanto ao futuro", "Acho que nada tenho a esperar", "Acho o futuro sem esperanças e tenho a impressão de que as coisas não podem melhor"),
    TestModel("Não me sinto um fracasso", "Acho que fracassei mais do que uma pessoa comum", "Quando olho pra trás, na minha vida, tudo o que posso ver é um monte de fracassos", " Acho que, como pessoa, sou um completo fracasso"),
    TestModel("Tenho tanto prazer em tudo como antes", "Não sinto mais prazer nas coisas como antes", "Não encontro um prazer real em mais nada", "Estou insatisfeito ou aborrecido com tudo"),
    TestModel("Não me sinto especialmente culpado", "Eu me sinto culpado grande parte do tempo", "Eu me sinto culpado na maior parte do tempo", "Eu me sinto sempre culpado"),
    TestModel("Não acho que esteja sendo punido", "Acho que posso ser punido", "Creio que vou ser punido", "Acho que estou sendo punido"),
    TestModel("Não me sinto decepcionado comigo mesmo", "Estou decepcionado comigo mesmo", "Estou enojado de mim", "Eu me odeio"),
    TestModel("Não me sinto de qualquer modo pior que os outros", "Sou crítico em relação a mim por minhas fraquezas ou erros", "Eu me culpo sempre por minhas falhas", "Eu me culpo por tudo de mal que acontece"),
    TestModel("Não tenho quaisquer idéias de me matar", "Tenho idéias de me matar, mas não as executaria", "Gostaria de me matar", "Eu me mataria se tivesse oportunidade"),
    TestModel("Não choro mais que o habitual", "Choro mais agora do que costumava", "Agora, choro o tempo todo", "Costumava ser capaz de chorar, mas agora não consigo, mesmo que o queria"),
    TestModel("Não sou mais irritado agora do que já fui", "Fico aborrecido ou irritado mais facilmente do que costumava", "Agora, eu me sinto irritado o tempo todo", "Não me irrito mais com coisas que costumavam me irritar"),
    TestModel("Não perdi o interesse pelas outras pessoas", "Estou menos interessado pelas outras pessoas do que costumava estar", "Perdi a maior parte do meu interesse pelas outras pessoas", "Perdi todo o interesse pelas outras pessoas"),
    TestModel("Tomo decisões tão bem quanto antes", "Adio as tomadas de decisões mais do que costumava", "Tenho mais dificuldades de tomar decisões do que antes", "Absolutamente não consigo mais tomar decisões"),
    TestModel("Não acho que de qualquer modo pareço pior do que antes", "Estou preocupado em estar parecendo velho ou sem atrativo", "Acho que há mudanças permanentes na minha aparência, que me fazem parecer sem atrativo", "Acredito que pareço feio"),
    TestModel("Posso trabalhar tão bem quanto antes", "É preciso algum esforço extra para fazer alguma coisa", "Tenho que me esforçar muito para fazer alguma coisa", "Não consigo mais fazer qualquer trabalho"),
    TestModel("Consigo dormir tão bem como o habitual", "Não durmo tão bem como costumava", "Acordo 1 a 2 horas mais cedo do que habitualmente e acho difícil voltar a dormir", "Acordo várias horas mais cedo do que costumava e não consigo voltar a dormir"),
    TestModel("Não fico mais cansado do que o habitual", "Fico cansado mais facilmente do que costumava", "Fico cansado em fazer qualquer coisa", "Estou cansado demais para fazer qualquer coisa"),
    TestModel("O meu apetite não está pior do que o habitual", "Meu apetite não é tão bom como costumava ser", "Meu apetite é muito pior agora", "Absolutamente não tenho mais apetite"),
    TestModel("Não tenho perdido muito peso se é que perdi algum recentemente", "Perdi mais do que 2 quilos e meio", "Perdi mais do que 5 quilos", "Perdi mais do que 7 quilos"),
    TestModel("Não estou mais preocupado com a minha saúde do que o habitual", "Estou preocupado com problemas físicos, tais como dores, indisposição do estômago ou constipação", "Estou muito preocupado com problemas físicos e é difícil pensar em outra coisa", "Estou tão preocupado com meus problemas físicos que não consigo pensar em qualquer outra coisa"),
    TestModel("Não notei qualquer mudança recente no meu interesse por sexo", "Estou menos interessado por sexo do que costumava", "Estou muito menos interessado por sexo agora", "Perdi completamente o interesse por sexo"),
  ];

  final msgResult = [
    "Você não está com depressão, mas está passando por um momento de melancolia. Pequenas mudanças na sua rotina como exercícios, boas interações e autocuidado podem te trazer mais leveza e bem-estar. Cuide-se.",
    "Você apresenta sinais de depressão leve, mas com mudanças no estilo de vida, como exercícios, boa alimentação, sono regulado e apoio emocional, é possível melhorar significativamente. Vamos superar juntos.",
    "Você tem sintomas de depressão moderada, mas com terapia, rotina saudável, atividades prazerosas e apoio, ter uma alimentação saudável é possível melhorar. Vamos trabalhar juntos para encontrar o melhor caminho para você.",
    "Seus sintomas são mais intensos, você precisa de ajuda de um profissional, contacte imediatamente o nosso psicólogo. Com acompanhamento próximo, terapia e suporte adequado, há caminhos para você se sentir melhor. Vamos enfrentar isso juntos, passo a passo."
  ];

  String progressMsg = "Você está indo bem 😊";
  bool showProgressMsg = false;

  @override
  void initState() {
    currentTest = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showProgressMsg)
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => setState(() => showProgressMsg = false),
                      child: Container(
                        width: width * .38,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue.withOpacity(.5),
                              Colors.pink.withOpacity(.8)
                            ],
                          ),
                        ),
                        child: Text(
                          progressMsg,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              AnimatedSwitcher(
                duration: currentTest == 0 ? const Duration(milliseconds: 800) : Duration.zero,
                transitionBuilder: (child, animation) {
                  final offset = (currentTest == 0 && listTest.indexOf(listTest[currentTest]) % 2 == 0)
                      ? const Offset(-1, 0)
                      : const Offset(1, 0);
                  return SlideTransition(
                    position: Tween<Offset>(begin: offset, end: Offset.zero).animate(animation),
                    child: child,
                  );
                },
                child: TestComponent(
                 // key: ValueKey(currentTest),
                  listTest[currentTest],
                  key: ValueKey(currentTest),
                  action: () {
                    setState(() {
                      if (currentTest < listTest.length - 1) {
                        currentTest++;
                        showProgressMsg = [1, 6, 10, 16].contains(currentTest);
                        if (currentTest == 6) {
                          progressMsg = "Continue";
                        } else if (currentTest == 10) progressMsg = "Já falta pouco 👏🏽";
                        else if (currentTest == 16) progressMsg = "Está quase terminando";
                      }

                      resultTest = listTest.fold(0, (sum, item) => sum + item.value);
                    });
                    verifyTest(context);
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }

  void verifyTest(BuildContext context) {
    if (currentTest == 20) {
      if (resultTest <= 12) {
        indexMsg = 0;
      } else if (resultTest >= 13 && resultTest <= 19) {
        indexMsg = 1;
      } else if (resultTest >= 20 && resultTest <= 28) {
        indexMsg = 2;
      } else {
        indexMsg = 3;
      }

      Color resultColor = indexMsg == 0
          ? Colors.green
          : indexMsg == 1
              ? const Color(0xFF4682B4) // Azul Oceano
              : indexMsg == 2
                  ? Colors.amber
                  : Colors.red;

      Future.delayed(const Duration(milliseconds: 3000), () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: resultColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Resultado:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  msgResult[indexMsg],
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      });
    }
  }
}