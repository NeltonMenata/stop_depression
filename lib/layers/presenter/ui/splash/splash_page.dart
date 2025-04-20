import 'package:flutter/material.dart';
import 'package:stop_depression/layers/presenter/routes/Routes.dart';
import 'package:stop_depression/layers/presenter/utils/utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenDark,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              Utils.assetLogo,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _login().then((value) => null);
    super.initState();
  }

  Future<void> _login() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.LOGIN);
    });
  }
}
