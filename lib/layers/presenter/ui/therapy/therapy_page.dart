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
                      Navigator.pushNamed(context, Routes.REGISTER_MOOD);
                    },
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/humor.jpg'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.7),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            'Registo de Humor',
                            style: TextStyle(
                                fontSize: width * .047,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.DESAFIO);
                    },
                    child: Container(
                      width: width * multiWidth,
                      height: width * multiHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/desafio.jpeg'),
                            opacity: .8),
                      ),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.7),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            'Desafios do Bem',
                            style: TextStyle(
                                fontSize: width * .047,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, Routes.REGISTER_MOOD);
                  //   },
                  //   child: Container(
                  //     width: width * multiWidth,
                  //     height: width * multiHeight,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       image: const DecorationImage(
                  //           fit: BoxFit.fill,
                  //           image: AssetImage('assets/images/planejar.jpg'),
                  //           opacity: .8),
                  //     ),
                  //     child: Center(
                  //       child: Container(
                  //         padding: const EdgeInsets.all(4),
                  //         decoration: BoxDecoration(
                  //           color: Colors.black.withOpacity(.7),
                  //           borderRadius: BorderRadius.circular(15),
                  //           border: Border.all(
                  //             color: Colors.black,
                  //           ),
                  //         ),
                  //         child: Text(
                  //           'Planejar o dia',
                  //           style: TextStyle(
                  //               fontSize: width * .047,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w700),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
