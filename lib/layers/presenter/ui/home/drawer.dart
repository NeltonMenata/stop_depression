import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';
import 'package:stop_depression/layers/presenter/utils/utils.dart';

class DrawerMain extends StatefulWidget {
  const DrawerMain({super.key});

  @override
  State<DrawerMain> createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    return Drawer(
          backgroundColor: Color.fromARGB(255, 15, 152, 187),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color.fromARGB(255, 13, 122, 149),),
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
                    Navigator.of(context).pushNamed(Routes.PERFIL);
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
                    Navigator.of(context).pushNamed(Routes.SETTINGS);
                  },
                ),
                const Spacer(),
                ListTile(
                  title: Text(
                    "Terminar Sessão",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: width * .04,
                    ),
                  ),
                  trailing: Icon(
                    Icons.logout_outlined,
                    color: Colors.black,
                    size: width * .08,
                  ),
                  onTap: () async {
                    final user = await ParseUser.currentUser() as ParseUser;
                    await user.logout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.LOGIN, (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Sessão terminada!",),
                    ));
                  },
                ),
              ],
            ),
          ),
        );
        
  }
}