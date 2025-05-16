import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_component.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_model.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

int currentTest = 0;

class _TestViewState extends State<TestView> {
  //int currentTest = 0;
  @override
  void initState() {
    currentTest = 0;
    super.initState();
  }

  final listTest = [
    TestModel(
        "Não me sinto triste",
        "Eu me sinto",
        "Estou sempre triste e não consigo sair disto",
        "Estou tão triste ou infeliz que não consigo suportar"),
    TestModel(
        "Não estou especialmente desanimado quanto ao futuro",
        "Eu me sinto desanimado quanto ao futuro",
        "Acho que nada tenho a esperar",
        "Acho o futuro sem esperanças e tenho a impressão de que as coisas não podem melhor"),
    TestModel(
        "Não me sinto um fracasso",
        "Acho que fracassei mais do que uma pessoa comum",
        "Quando olho pra trás, na minha vida, tudo o que posso ver é um monte de fracassos",
        " Acho que, como pessoa, sou um completo fracasso"),
    TestModel(
      "Tenho tanto prazer em tudo como antes",
      "Não sinto mais prazer nas coisas como antes",
      "Não encontro um prazer real em mais nada",
      "Estou insatisfeito ou aborrecido com tudo",
    ),
    TestModel(
        "Não me sinto especialmente culpado",
        "Eu me sinto culpado grande parte do tempo",
        "Eu me sinto culpado na maior parte do tempo",
        "Eu me sinto sempre culpado"),
    TestModel("Não acho que esteja sendo punido", "Acho que posso ser punido",
        "Creio que vou ser punido", "Acho que estou sendo punido"),
    TestModel(
        "Não me sinto decepcionado comigo mesmo",
        "Estou decepcionado comigo mesmo",
        "Estou enojado de mim",
        "Eu me odeio"),
    TestModel(
        "Não me sinto de qualquer modo pior que os outros",
        "Sou crítico em relação a mim por minhas fraquezas ou erros",
        "Eu me culpo sempre por minhas falhas",
        "Eu me culpo por tudo de mal que acontece"),
    TestModel(
        "Não tenho quaisquer idéias de me matar",
        "Tenho idéias de me matar, mas não as executaria",
        "Gostaria de me matar",
        "Eu me mataria se tivesse oportunidade"),
    TestModel(
        "Não choro mais que o habitual",
        "Choro mais agora do que costumava",
        "Agora, choro o tempo todo",
        "Costumava ser capaz de chorar, mas agora não consigo, mesmo que o queria"),
    TestModel(
        "Não sou mais irritado agora do que já fui",
        "Fico aborrecido ou irritado mais facilmente do que costumava",
        "Agora, eu me sinto irritado o tempo todo",
        "Não me irrito mais com coisas que costumavam me irritar"),
    TestModel(
        "Não perdi o interesse pelas outras pessoas",
        "Estou menos interessado pelas outras pessoas do que costumava estar",
        "Perdi a maior parte do meu interesse pelas outras pessoas",
        "Perdi todo o interesse pelas outras pessoas"),
    TestModel(
        "Tomo decisões tão bem quanto antes",
        "Adio as tomadas de decisões mais do que costumava",
        "Tenho mais dificuldades de tomar decisões do que antes",
        "Absolutamente não consigo mais tomar decisões"),
    TestModel(
        "Não acho que de qualquer modo pareço pior do que antes",
        "Estou preocupado em estar parecendo velho ou sem atrativo",
        "Acho que há mudanças permanentes na minha aparência, que me fazem parecer sem atrativo",
        "Acredito que pareço feio"),
    TestModel(
        "Posso trabalhar tão bem quanto antes",
        "É preciso algum esforço extra para fazer alguma coisa",
        "Tenho que me esforçar muito para fazer alguma coisa",
        "Não consigo mais fazer qualquer trabalho"),
    TestModel(
        "Consigo dormir tão bem como o habitual",
        "Não durmo tão bem como costumava",
        "Acordo 1 a 2 horas mais cedo do que habitualmente e acho difícil voltar a dormir",
        "Acordo várias horas mais cedo do que costumava e não consigo voltar a dormir"),
    TestModel(
        "Não fico mais cansado do que o habitual",
        "Fico cansado mais facilmente do que costumava",
        "Fico cansado em fazer qualquer coisa",
        "Estou cansado demais para fazer qualquer coisa"),
    TestModel(
        "O meu apetite não está pior do que o habitual",
        "Meu apetite não é tão bom como costumava ser",
        "Meu apetite é muito pior agora",
        "Absolutamente não tenho mais apetite"),
    TestModel(
        "Não tenho perdido muito peso se é que perdi algum recentemente",
        "Perdi mais do que 2 quilos e meio",
        "Perdi mais do que 5 quilos",
        "Perdi mais do que 7 quilos"),
    TestModel(
        "Não estou mais preocupado com a minha saúde do que o habitual",
        "Estou preocupado com problemas físicos, tais como dores, indisposição do estômago ou constipação",
        "Estou muito preocupado com problemas físicos e é difícil pensar em outra coisa",
        "Estou tão preocupado com meus problemas físicos que não consigo pensar em qualquer outra coisa"),
    TestModel(
        "Não notei qualquer mudança recente no meu interesse por sexo",
        "Estou menos interessado por sexo do que costumava",
        "Estou muito menos interessado por sexo agora",
        "Perdi completamente o interesse por sexo"),
  ];

  int resultTest = 0;

  final msgResult = [
    "Seus sintomas indicam melancolia, algo passageiro. Atividades prazerosas, exercícios, sono regulado e apoio emocional podem ajudar. Vamos acompanhar e, se precisar, ajustamos o cuidado juntos.",
    "Você apresenta sinais de depressão leve, mas com mudanças no estilo de vida, como exercícios, boa alimentação, sono regulado e apoio emocional, é possível melhorar significativamente. Vamos superar juntos.",
    "Você tem sintomas de depressão moderada, mas com terapia, rotina saudável, atividades prazerosas e apoio, ter uma alimentação saudável é possível melhorar. Vamos trabalhar juntos para encontrar o melhor caminho para você.",
    "Seus sintomas são mais intensos, você precisa de ajuda de um profissional, contacte imediatamente o nosso psicólogo. Com acompanhamento próximo, terapia e suporte adequado, há caminhos para você se sentir melhor. Vamos enfrentar isso juntos, passo a passo."
  ];

  int indexMsg = 0;

  String progressMsg = "Você está indo bem 😊";
  bool showProgressMsg = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (currentTest == 1) {
      setState(() {
        showProgressMsg = true;
      });
    } else if (currentTest == 6) {
      setState(() {
        progressMsg = "Continue";
        showProgressMsg = true;
      });
    } else if (currentTest == 10) {
      setState(() {
        progressMsg = "Já falta pouco 👏🏽";
        showProgressMsg = true;
      });
    } else if (currentTest == 16) {
      setState(() {
        progressMsg = "Está quase terminando";
        showProgressMsg = true;
      });
    } else {
      setState(() {
        showProgressMsg = false;
      });
    }

    return Stack(
      //mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: showProgressMsg,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        print("############ clicou ##########");
                        setState(() {
                          showProgressMsg = false;
                        });
                      },
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
                                  ])),
                          child: Text(
                            progressMsg,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                height: .95,
                                fontSize: 12.5),
                          )),
                    ),
                  ),
                ),
              ),
              TestComponent(
                action: () {
                  Future.delayed(const Duration(seconds: 0), () {
                    //print(listTest[currentTest].value);
                    setState(() {
                      if (!(currentTest == (listTest.length - 1))) {
                        currentTest++;
                      }
                      int currentValue = 0;
                      for (var element in listTest) {
                        currentValue += element.value;
                      }
                      resultTest = currentValue;
                    });
                    verifyTest(context);
                  });
                },
                listTest[currentTest],
              ),

              const SizedBox(
                height: 12,
              ),
              //Text("Resultado: ${resultTest}"),
              // ElevatedButton(
              //   onPressed: () {
              //     //showAboutDialog(context: context,);
              //     verifyTest(context);
              //   },
              //   child: const Text("Resultado do Teste"),
              // )
            ],
          ),
        ),
      ],
    );
  }

  void verifyTest(BuildContext context) {
    if (currentTest == 20) {
      if (resultTest < 13) {
        indexMsg = 0;
      } else if (resultTest > 13 && resultTest <= 19) {
        indexMsg = 1;
      } else if (resultTest > 19 && resultTest <= 28) {
        indexMsg = 2;
      } else {
        indexMsg = 3;
      }
      Future.delayed(const Duration(milliseconds: 3000), () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: indexMsg == 0
                      ? Colors.greenAccent
                      : indexMsg == 1
                          ? Colors.greenAccent
                          : indexMsg == 2
                              ? Colors.amber
                              : Colors.red,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Resultado:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
                ));
      });
    } else {
      // showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //           content: const Text("Termine o teste para ver o resultado"),
      //           actions: [
      //             TextButton(
      //               child: const Text("Ok"),
      //               onPressed: () {
      //                 Navigator.pop(context);
      //               },
      //             )
      //           ],
      //         ));
    }
  }
}
