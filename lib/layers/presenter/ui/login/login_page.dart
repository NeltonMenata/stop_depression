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
    final fontSizeTitle = width * .04;
    final fontSizeTitleLabel = width * .045;

    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: Stack(
        //fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/login.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
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
                            "assets/images/logo.png",
                            height: width * 0.3,
                            width: width * 0.3,
                            fit: BoxFit.cover,
                          )),
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        gradient: LinearGradient(colors: [
                          const Color.fromARGB(255, 33, 233, 243),
                          Color.fromARGB(255, 23, 101, 164),
                        ]),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              "Inicie sua Sessão no Stop Depression",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: fontSizeTitle),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Usuário",
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: fontSizeTitleLabel,
                                      fontWeight: FontWeight.w900),
                                ),
                                TextField(
                                  controller: username,
                                  keyboardType: TextInputType.emailAddress,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                    border: OutlineInputBorder(),
                                    hintText: "Email",
                                    suffixIcon: Icon(
                                      Icons.person_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 12.0, left: 12.0, ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Senha",
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontSize: fontSizeTitleLabel,
                                      fontWeight: FontWeight.w900),
                                ),
                                TextField(
                                  controller: password,
                                  obscureText: hiddenPassword,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
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
                                          color: Colors.white,
                                        )),
                                  ),
                                  onSubmitted: (value) {},
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      child: const Text(
                                        "",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      onPressed: () {}),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                 left: 10, right: 10, bottom: 6),
                            child: isLogin
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ElevatedButton(
                                    child: Text(
                                      "Entrar no Sistema",
                                      style:
                                          TextStyle(fontSize: fontSizeTitleLabel),
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
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
