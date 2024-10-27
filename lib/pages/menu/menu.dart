import 'package:flutter/material.dart';
import 'package:my_app_despesas/doc/api/user/user_api.dart';
import 'package:my_app_despesas/pages/splash/splash.dart';

class Menu extends StatelessWidget {
  final Map<String, dynamic>? data;
  const Menu({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    UserApi api = UserApi();
    return Scaffold(
      body: Column(
        children: [
          Text(data?['name'] ?? 'Não dispónivel'),
          ElevatedButton(
              onPressed: () {
                api.deleteUser();

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const Splash()));
              },
              child: const Text('deletar usuario'))
        ],
      ),
    );
  }
}
