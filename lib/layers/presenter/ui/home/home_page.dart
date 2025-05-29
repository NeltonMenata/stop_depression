import 'package:stop_depression/layers/presenter/routes/Routes.dart';
import 'package:stop_depression/layers/presenter/ui/doctor/doctor_view.dart';
import 'package:stop_depression/layers/presenter/ui/home/drawer.dart';
import 'package:stop_depression/layers/presenter/ui/home/page_view_item.dart';
import 'package:stop_depression/layers/presenter/ui/statistcs/statistcs_view.dart';
import 'package:stop_depression/layers/presenter/ui/user/user_view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String title = "Home Page";

  late VideoPlayerController videoPlayerController;

  double viewPort = .7;
  late PageController pageController;
  int currentIndex = 0;

  int index = 0;
  List<String> titles = [
    'Inicio',
    'Estatísticas',
    'Perfil',
    'Psicólogo',
  ];
  late TabController tabController;
  void setIndex(int n) {
    setState(() {
      index = n;
    });
  }

  @override
  void initState() {
    videoPlayerController =
        VideoPlayerController.asset("assets/videos/home.mp4")
          ..initialize().then((value) {
            setState(() {
              videoPlayerController.play();
              videoPlayerController.setLooping(true);
            });
          });
    pageController = PageController(viewportFraction: viewPort);
    tabController = TabController(length: 4, vsync: this); // 3 abas
    currentIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    tabController.dispose();
    super.dispose();
  }

  final pageViewsContent = [
    {
      "title": "QUIZ",
      "subtitle":
          "Aprenda de forma divertida e interativa sobre a depressão. Saiba quais são as suas causas e cuidados a ter para não cair nela.",
      "image": "assets/images/quiz1.jpg",
      "color": const Color.fromARGB(255, 13, 107, 130),
      "action": (BuildContext context) => {Navigator.pushNamed(context, Routes.QUIZ)}
    },
    {
      "title": "TESTE",
      "subtitle":
          "Descubra mais sobre seu bem-estar emocional! Faça o teste agora e entenda melhor seus sentimentos. Seu autocuidado começa aqui!",
      "image": "assets/images/teste1.jpg",
      "color": Colors.brown.shade900,
      "action": (BuildContext context) =>
          {Navigator.pushNamed(context, Routes.TEST_DESC_1)}
    },
    {
      "title": "TERAPIA",
      "subtitle":
          "Cuidar da sua saúde mental é essencial. Nossas terapias oferecem apoio profissional e acolhimento. Dê o primeiro passo para seu bem-estar!",
      "image": "assets/images/terapia1.jpg",
      "color": Colors.lightGreen.shade800,
      "action": (BuildContext context) =>
          {Navigator.pushNamed(context, Routes.THERAPY)}
    },
  ];

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // const paddingLeft = 10.0;
    // final paddingTop = height * 0.03;
    // const paddingBottom = 15.0;
    // final fontSizeTitle = width * .08;
    // final fontSizeSubtitle = width * .05;
    //final allPadding = width * .020;

    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Clique em Terminar Sessão para sair!"),
          ),
        );
        return false;
      },
      child: Scaffold(
        drawer: const DrawerMain(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 15, 152, 187),
          title: Text(
            titles[index],
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: AspectRatio(
                      aspectRatio: videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(videoPlayerController),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * .03,
                      ),
                      child: PageView.builder(
                        itemCount: pageViewsContent.length,
                        controller: pageController,
                        onPageChanged: (index) {
                          setState(() {
                            //
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) => PageViewItem(
                            title: pageViewsContent[index]["title"].toString(),
                            subtitle: pageViewsContent[index]["subtitle"].toString(),
                            image: pageViewsContent[index]["image"].toString(),
                            color: pageViewsContent[index]["color"],
                            activePage: index == currentIndex,
                            action: pageViewsContent[index]["action"],),
                      )

                      // PageView(
                      //   controller: pageController,
                      //   onPageChanged: (index) {
                      //     setState(() {
                      //       //
                      //       currentIndex = index;
                      //     });
                      //   },
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           //Navigator.pushNamed(context, Routes.LOGIN);
                      //         },
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               image: const DecorationImage(
                      //                 fit: BoxFit.fill,
                      //                 //opacity: .9,
                      //                 image:
                      //                     AssetImage("assets/images/quiz1.jpg"),
                      //               ),
                      //               borderRadius: BorderRadius.circular(20)),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               const Padding(
                      //                 padding: EdgeInsets.all(8.0),
                      //                 child: Text(
                      //                   "QUIZ",
                      //                   style: TextStyle(
                      //                     //fontFamily: "Meridian",
                      //                     fontSize: 34,
                      //                     fontWeight: FontWeight.w900,
                      //                     color: Colors.white,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Container(
                      //                 decoration: const BoxDecoration(
                      //                     color:
                      //                         Color.fromARGB(255, 13, 107, 130),
                      //                     borderRadius: BorderRadius.vertical(
                      //                         bottom: Radius.circular(20))),
                      //                 child: const Padding(
                      //                   padding: EdgeInsets.all(8.0),
                      //                   child: Text(
                      //                     "Aprenda de forma divertida e interativa sobre a depressão. Saiba quais são as suas causas e cuidados a ter para não cair nela.",
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(color: Colors.white),
                      //                   ),
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           Navigator.pushNamed(context, Routes.TEST_DESC_1);
                      //         },
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               image: const DecorationImage(
                      //                 //opacity: .9,
                      //                 fit: BoxFit.fill,
                      //                 image:
                      //                     AssetImage("assets/images/teste1.jpg"),
                      //               ),
                      //               borderRadius: BorderRadius.circular(20)),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               const Padding(
                      //                 padding: EdgeInsets.all(8.0),
                      //                 child: Text(
                      //                   "TESTE",
                      //                   style: TextStyle(
                      //                     fontSize: 34,
                      //                     fontWeight: FontWeight.w900,
                      //                     color: Colors.white,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.brown.shade900,
                      //                     borderRadius:
                      //                         const BorderRadius.vertical(
                      //                             bottom: Radius.circular(20))),
                      //                 child: const Padding(
                      //                   padding: EdgeInsets.all(8.0),
                      //                   child: Text(
                      //                     "Descubra mais sobre seu bem-estar emocional! Faça o teste agora e entenda melhor seus sentimentos. Seu autocuidado começa aqui!",
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(color: Colors.white),
                      //                   ),
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           Navigator.pushNamed(context, Routes.THERAPY);
                      //         },
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //               image: const DecorationImage(
                      //                 fit: BoxFit.fill,
                      //                 image: AssetImage(
                      //                     "assets/images/terapia1.jpg"),
                      //               ),
                      //               borderRadius: BorderRadius.circular(20)),
                      //           child: Column(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               const Padding(
                      //                 padding: EdgeInsets.all(8.0),
                      //                 child: Text(
                      //                   "TERAPIA",
                      //                   style: TextStyle(
                      //                     fontSize: 34,
                      //                     fontWeight: FontWeight.w900,
                      //                     color: Colors.white,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Container(
                      //                 decoration: BoxDecoration(
                      //                     color: Colors.lightGreen.shade800,
                      //                     borderRadius:
                      //                         const BorderRadius.vertical(
                      //                             bottom: Radius.circular(20))),
                      //                 child: const Padding(
                      //                   padding: EdgeInsets.all(8.0),
                      //                   child: Text(
                      //                     "Cuidar da sua saúde mental é essencial. Nossas terapias oferecem apoio profissional e acolhimento. Dê o primeiro passo para seu bem-estar!",
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(color: Colors.white),
                      //                   ),
                      //                 ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      ),
                ],
              ),
            ),
            const StatistcsView(),
            PerfilPage(),
            PsychologistProfilePage() //DoctorView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          //fixedColor: Colors.blue,
          useLegacyColorScheme: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blue.shade200,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 15, 152, 187),
              label: 'Inicio',
              icon: IconButton(
                iconSize: 35,
                icon: const Icon(Icons.home),
                onPressed: () {
                  tabController.animateTo(0);
                  setIndex(0);
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 15, 152, 187),
              label: 'Estatística',
              icon: IconButton(
                iconSize: 35,
                icon: Image.asset(
                  "assets/icon/statistcs.png",
                  height: 35,
                  width: 35,
                ),
                onPressed: () {
                  tabController.animateTo(1);
                  setIndex(1);
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 15, 152, 187),
              label: 'Perfil',
              icon: IconButton(
                iconSize: 35,
                icon: const Icon(Icons.person),
                onPressed: () {
                  tabController.animateTo(2);
                  setIndex(2);
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 15, 152, 187),
              label: 'Psicólogo',
              icon: IconButton(
                iconSize: 35,
                icon: Image.asset(
                  "assets/icon/doctor1.jpg",
                  width: 35,
                  height: 35,
                ),
                onPressed: () {
                  tabController.animateTo(3);
                  setIndex(3);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
