import 'package:stop_depression/layers/presenter/routes/Routes.dart';
import 'package:stop_depression/layers/presenter/ui/home/button_component.dart';
import 'package:stop_depression/layers/presenter/ui/home/table_component.dart';
import 'package:stop_depression/layers/presenter/ui/test/test_view.dart';
import 'package:stop_depression/layers/presenter/ui/therapy/therapy_page.dart';
import 'package:stop_depression/layers/presenter/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String title = "Home Page";

  int index = 0;
  List<String> titles = [
    'Inicio',
    'Quiz',
    'Terapia',
    'Teste',
  ];
  late TabController tabController;
  void setIndex(int n) {
    setState(() {
      index = n;
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this); // 3 abas
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
        drawer: Drawer(
          backgroundColor: Colors.blue.shade300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade600
                  ),
                  accountName: const Text(
                    "Usuario",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  accountEmail: const Text("Atividade"),
                  currentAccountPicture: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(Utils.assetLogo)),
                ),
                ListTile(
                  title: Text(
                    "Perfil",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * .04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.person,
                    size: width * .08,
                  ),
                  onTap: () {
                    //Navigator.of(context).pushNamed(Routes.CREATE_WORKER);
                  },
                ),
                ListTile(
                  title: Text(
                    "Descobrir",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * .04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.search,
                    size: width * .08,
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed(Routes.VIEW_MANAGER);
                  },
                ),
                ListTile(
                  title: Text(
                    "Ajustes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * .04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.settings,
                    size: width * .08,
                  ),
                  onTap: () {
                    // Navigator.of(context).pushNamed(Routes.VIEW_MANAGER);
                  },
                ),
                const Spacer(),
                ListTile(
                  title: Text(
                    "Terminar Sessão",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                      fontSize: width * .04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.logout_outlined,
                    color: Colors.blue.shade900,
                    size: width * .08,
                  ),
                  onTap: () async {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.LOGIN, (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Terminando a sessão. Aguarde!"),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            titles[index],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // body: Stack(
        //   children: [
        //     Image.asset(
        //       "assets/video.gif",
        //       width: double.infinity,
        //       height: double.infinity,
        //       fit: BoxFit.cover,
        //     ),
        //     Padding(
        //         padding: const EdgeInsets.all(12.0),
        //         child: Center(
        //           child: Text("Explore, aprenda e cuide da sua saude mental"),
        //         ))
        //   ],
        // ),
        body: TabBarView(
          controller: tabController,
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue.shade300,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/video.gif",
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Explore, aprenda e cuide da sua saúde mental",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Seja bem-vindo! Aqui voçê encontrará apoio, conhecimento e ferramentas para compreender e superar a depressão.",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            TableComponent(
              color: Colors.indigo.shade300,
            ),
            const TherapyPage(),
            const TestView()
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
              backgroundColor: Colors.blue.shade300,
              label: 'Inicio',
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  tabController.animateTo(0);
                  setIndex(0);
                },
              ),
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue.shade300,
                label: '',
                icon: ButtonComponent(
                  action: () {
                    tabController.animateTo(1);
                    setIndex(1);
                  },
                  urlImage: 'assets/images/quiz.jpeg',
                  title: "Quiz",
                  height: 30,
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue.shade300,
                label: '',
                icon: ButtonComponent(
                  action: () {
                    tabController.animateTo(2);
                    setIndex(2);
                  },
                  urlImage: 'assets/images/terapia.jpeg',
                  title: "Terapia",
                  height: 30,
                )),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue.shade300,
                label: '',
                icon: ButtonComponent(
                  action: () {
                    tabController.animateTo(3);
                    setIndex(3);
                  },
                  urlImage: "assets/images/teste.jpeg",
                  height: 30,
                  title: "Teste",
                )),
          ],
        ),
      ),
    );
  }
}
