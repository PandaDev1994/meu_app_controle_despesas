import 'package:flutter/material.dart';
import 'package:my_app_despesas/comuns/comuns.dart';
import 'package:my_app_despesas/doc/api/user/user_api.dart';
import 'package:my_app_despesas/pages/splash/splash.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool visibilityOff = false;

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    textFieldForNameAndEmail(
                      emailController,
                      'E-mail',
                      'Digite seu e-mail aqui',
                    ),
                    textFieldForPass(
                      passController,
                      'Senha',
                      '***********',
                      visibilityOff ? Icons.visibility_off : Icons.visibility,
                      visibilityOff,
                      () {
                        setState(() {
                          visibilityOff = !visibilityOff;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buttonCustom('Entrar', () => entrar()),
                    buttonCustom('sair', () => sair()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sair() async {
    UserApi userApi = UserApi();
    await userApi.deleteUser();

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const Splash()));
  }

  void entrar() async {
    UserApi userApi = UserApi();
    bool userLogged =
        await userApi.validationUser(emailController.text, passController.text);

    if (userLogged) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Splash()));
    }
  }
}
