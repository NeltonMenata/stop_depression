import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';
import 'package:stop_depression/layers/presenter/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final controller = getIt<LoginController>();
  bool isLogin = false;

  final username = TextEditingController();
  final password = TextEditingController();
  bool hiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const paddingLeft = 15.0;
    final paddingTop = height * 0.07;
    const paddingBottom = 15.0;
    final fontSizeTitle = width * .08;
    final fontSizeTitleLabel = width * .045;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        //fit: StackFit.expand,
        children: [
          // Image.asset(
          //   'assets/images/bg-splash.jpg',
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: paddingLeft,
                        top: paddingTop,
                        bottom: paddingBottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(
                              child: Image.asset(
                            Utils.assetLogo,
                            height: width * 0.2,
                            width: width * 0.2,
                            fit: BoxFit.cover,
                          )),
                        ),
                        Text(
                          "Inicie sua Sessão no Stop Depression",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: fontSizeTitle),
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Usuario",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSizeTitleLabel,
                              fontWeight: FontWeight.w900),
                        ),
                        TextField(
                          controller: username,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            disabledBorder:
                                OutlineInputBorder(borderSide: BorderSide()),
                            border: OutlineInputBorder(),
                            hintText: "Email",
                            suffixIcon: Icon(
                              Icons.person_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 12.0, left: 12.0, top: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Senha",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSizeTitleLabel,
                              fontWeight: FontWeight.w900),
                        ),
                        TextField(
                          controller: password,
                          obscureText: hiddenPassword,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(),
                            hintText: "Palavra-passe",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hiddenPassword = !hiddenPassword;
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.grey,
                                )),
                          ),
                          onSubmitted: (value) {},
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              child: const Text(
                                "Esqueceu a palavra-passe?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              onPressed: () {}),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 6, left: 10, right: 10, bottom: 6),
                    child: isLogin
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            child: Text(
                              "Entrar no Sistema",
                              style: TextStyle(fontSize: fontSizeTitleLabel),
                            ),
                            onPressed: () async {
                              if (username.text.isEmpty ||
                                  password.text.isEmpty) {
                                showResultCustom(context,
                                    "Preencha os campos correctamente!",
                                    isError: true);
                                return;
                              }
                              setState(() {
                                isLogin = true;
                              });

                              await Future.delayed(Duration(seconds: 3));

                              setState(() {
                                isLogin = false;
                              });
                              Navigator.pushNamed(context, Routes.HOME);
                            },
                          ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
