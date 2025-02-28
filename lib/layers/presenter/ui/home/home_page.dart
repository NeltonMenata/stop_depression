import 'package:stop_depression/layers/presenter/routes/Routes.dart';
import 'package:stop_depression/layers/presenter/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Home Page";

  int index = 0;
  List<String> titles = ['Inicio', 'Sobre', 'Descobre', 'Perfil', 'Ajuste'];

  void setIndex(int n) {
    setState(() {
      index = n;
    });
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
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
                    "Fatores da depressao",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * .04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.group_add_outlined,
                    size: width * .10,
                  ),
                  onTap: () {
                    //Navigator.of(context).pushNamed(Routes.CREATE_WORKER);
                  },
                ),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: Text(
                      "Consequencias da depressao",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * .04,
                      ),
                    ),
                    trailing: Icon(
                      Icons.group,
                      size: width * .10,
                    ),
                    onTap: () {
                      // Navigator.of(context).pushNamed(Routes.VIEW_MANAGER);
                    },
                  ),
                ),
                const Spacer(),
                ListTile(
                  title: Text(
                    "Terminar Sessão",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: width * .04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                    size: width * .10,
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
        body: Stack(
          children: [
            Image.asset(
              "assets/video.gif",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Card(
                              color: Colors.transparent,
                              child: SizedBox(
                                height: 100,
                                width: width * .36,
                                child: Image.asset(
                                  'assets/images/quiz.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                          const Text(
                            "Quiz",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            child: Card(
                              color: Colors.transparent,
                              child: SizedBox(
                                height: 100,
                                width: width * .36,
                                child: Image.asset(
                                  'assets/images/terapia.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.THERAPY);
                            },
                          ),
                          const Text(
                            "Terapia",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            child: Card(
                              color: Colors.transparent,
                              child: SizedBox(
                                  height: 100,
                                  width: width * .36,
                                  child: Image.asset(
                                    'assets/images/teste.jpg',
                                    fit: BoxFit.fitHeight,
                                  )),
                            ),
                            onPressed: () {},
                          ),
                          const Text(
                            "Teste",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
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
              backgroundColor: Colors.blue.shade900,
              label: 'Inicio',
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setIndex(0);
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue.shade900,
              label: 'Sobre',
              icon: IconButton(
                icon: Icon(Icons.warning_amber_rounded),
                onPressed: () {
                  setIndex(1);
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue.shade900,
              label: 'Descobre',
              icon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setIndex(2);
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue.shade900,
              label: 'Perfil',
              icon: IconButton(
                icon: Icon(Icons.person_pin),
                onPressed: () {
                  setIndex(3);
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue.shade900,
              label: 'Ajuste',
              icon: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  setIndex(4);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
