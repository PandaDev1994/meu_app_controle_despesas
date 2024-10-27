import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyExpenses());
}

class MyExpenses extends StatelessWidget {
  const MyExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
