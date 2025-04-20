import 'package:flutter/material.dart';
import 'package:stop_depression/layers/core/open_links.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';
//import 'package:stop_depression/layers/presenter/routes/Routes.dart';
//import 'package:stop_depression/layers/presenter/utils/utils.dart';

class TherapyPage extends StatefulWidget {
  const TherapyPage({Key? key}) : super(key: key);

  @override
  State<TherapyPage> createState() => _TherapyPageState();
}

class _TherapyPageState extends State<TherapyPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    const multiHeight = .6;
    const multiWidth = .85;

    return Scaffold(
      backgroundColor: Colors.indigo.shade300,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Terapia',
          style: TextStyle(
            //color: Colors.white,
            //fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // TextButton(
                  //   onPressed: (){
                  //     Navigator.pushNamed(context,Routes.REGISTER_MOOD);
                  //   },
                  //   child:
                  // ),

                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context,Routes.REGISTER_MOOD);
                    },
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/respiracao.jpg'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Text(
                          'Registo de Humor',
                          style: TextStyle(
                              fontSize: width * .06,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // TextButton(
                  //   onPressed: abrirAppRespiracao,
                  //   child: Container(
                  //     width: width * multiWidth,
                  //     height: width * multiHeight,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       image: const DecorationImage(
                  //           fit: BoxFit.fill,
                  //           image: AssetImage('assets/images/respiracao.jpg'),
                  //           opacity: .8),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         'Exercicios de Respiracao',
                  //         style: TextStyle(
                  //             fontSize: width * .06,
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w700),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  TextButton(
                    onPressed: abrirBiblia,
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/biblia.jpg'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Text(
                          'Biblia',
                          style: TextStyle(
                              fontSize: width * .06,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: abrirMusicasRelaxantes,
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/musica.jpg'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Text(
                          'Musico-terapia',
                          style: TextStyle(
                              fontSize: width * .06,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: abrirVideosAlimentacaoSaudavel,
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/alimentacao.jpg'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Text(
                          'Alimentação Saudável',
                          style: TextStyle(
                              fontSize: width * .06,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: abrirTecnicasRelaxamento,
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/relaxamento.jpg'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Text(
                          'Tecnicas de Relaxamento',
                          style: TextStyle(
                              fontSize: width * .06,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: abrirVideosExercicios,
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/exercicio-fisico.jpg'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Text(
                          'Exercícios Físicos',
                          style: TextStyle(
                              fontSize: width * .06,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: abrirDiarioOnline,
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/diario.webp'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Text(
                          'Diário Online',
                          style: TextStyle(
                              fontSize: width * .06,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
