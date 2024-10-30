// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_app_despesas/doc/api/user/user_api.dart';
import 'package:my_app_despesas/pages/menu/menu.dart';
import 'package:my_app_despesas/pages/register/register.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

final api = UserApi();

class _SplashState extends State<Splash> {
  @override
  void initState() {
    initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.sizeOf(context).height;
    var sizeW = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Container(
          height: sizeH,
          width: sizeW,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://www.adirondackbank.com/assets/Blog/Nov29_Expenses.png',
              ),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> initUser() async {
    Map<String, dynamic> user = await api.getUser();

    // ignore: unnecessary_null_comparison
    if (user != null && user.isNotEmpty && user['id'] != null) {
      // Se o usuário existe, navegue para o Menu
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => Menu(data: user),
      ));
    } else {
      // Se não, vá para a tela de Registro
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const Register(),
      ));
    }
  }
}
