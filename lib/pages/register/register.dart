import 'package:flutter/material.dart';
import 'package:my_app_despesas/doc/api/user/user_api.dart';

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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buttonCustom('Cadastrar', () => senUser()),
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
    print("apertei");
    var result = await apiUser.addNewUser(
      nameController.text,
      passController.text,
      emailController.text,
    );

    print(result);
  }

  ElevatedButton buttonCustom(String label, VoidCallback voidCallback) {
    return ElevatedButton.icon(
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.greenAccent)),
      onPressed: voidCallback,
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      icon: const Icon(Icons.send_sharp),
      iconAlignment: IconAlignment.end,
    );
  }

  Padding textFieldForNameAndEmail(
      TextEditingController controller, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }

  Padding textFieldForPass(TextEditingController controller, String label,
      String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: TextField(
        obscureText: visibilityOff,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          labelText: label,
          hintText: hint,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visibilityOff = !visibilityOff;
              });
            },
            icon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
