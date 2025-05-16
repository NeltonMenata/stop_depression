import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';

class LoginController{
  static Future<void> logar(BuildContext context, String username, String password) async {
    //
    try {
      final user = ParseUser(username, password, null);

      final result = await user.login();
      if (result.statusCode == 200 && result.success) {
        Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (route) => false);
      } else if (result.statusCode == -1) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao logar, verifique a sua internet!')));
      } else {
        //Verifique os dados do usuario
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao logar, verifique seu email e senha!')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao logar, verifique seu email e senha ou a sua internet!')));
      //Verifique os dados de usuario e a conexao com a internet
    }
  }

  static Future<void> criarConta(BuildContext context, String username, String password) async {
    //
    try {
      final user = ParseUser(username, password, null);

      final result = await user.create();

      if (result.success) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Conta criada com sucesso, faça login!')));
        Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (route) => false);
      } else if (result.statusCode == -1) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao criar conta, verifique a sua internet!')));
      } else {
        //Verifique os dados do usuario
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao criar conta, ${result.error?.message}!')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao criar conta, verifique seu email e senha ou a sua internet!')));
      //Verifique os dados de usuario e a conexao com a internet
    }
  }
}
