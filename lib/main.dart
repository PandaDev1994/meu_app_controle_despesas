import 'package:flutter/material.dart';
import 'package:my_app_despesas/pages/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyExpenses());
}

class MyExpenses extends StatelessWidget {
  const MyExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
