// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_app_despesas/comuns/comuns.dart';
import 'package:my_app_despesas/doc/api/user/user_api.dart';
import 'package:my_app_despesas/pages/login/login.dart';
import 'package:my_app_despesas/pages/splash/splash.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

final apiUser = UserApi();

bool visibilityOff = false;

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    textFieldForNameAndEmail(
                        nameController, 'Nome', 'Digite seu nome aqui'),
                    textFieldForNameAndEmail(
                        emailController, 'Email', 'Digite seu email aqui'),
                    textFieldForPass(
                        passController,
                        'Senha',
                        '***********',
                        visibilityOff ? Icons.visibility_off : Icons.visibility,
                        visibilityOff, () {
                      setState(() {
                        visibilityOff = !visibilityOff;
                      });
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    buttonCustom('Cadastrar', () => senUser()),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Já possui cadastro?'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const Login()));
                            },
                            child: const Text('Clique aqui'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void senUser() async {
    var result = await apiUser.addNewUser(
      nameController.text,
      passController.text,
      emailController.text,
    );

    if (result.isEmpty) {
      null;
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Splash()));
    }
  }
}
