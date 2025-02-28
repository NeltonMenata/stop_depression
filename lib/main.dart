import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes(context),
      initialRoute: Routes.SPLASH,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              primary: Colors.blue.shade900,
              brightness: Brightness.light,
              secondary: Colors.blue.shade700)),
      //
      //home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      // Simulando um login simples (email e senha fixos)
      if (email == "teste@email.com" && password == "123456") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email ou senha incorretos!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Login",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite seu email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "Senha"),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite sua senha";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text("Entrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Tela inicial após o login bem-sucedido
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width; //context.size?.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Bem-vindo!")),
      body: Stack(
        children: [
          Image.asset(
            "assets/video.gif",
            width: width,
            //repeat: ImageRepeat.repeat,
            //fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              runSpacing: 20,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: width * .4,
                        child: const Text(
                          "",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Text(
                      "Quiz",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: width * .4,
                        child: const Text(
                          "",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Text(
                      "Terapia",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      child: SizedBox(
                        height: 100,
                        width: width * .4,
                        child: const Text(
                          "",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Text(
                      "Teste",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
