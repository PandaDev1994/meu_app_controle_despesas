// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:my_app_despesas/pages/expenses/expenses.dart';
import 'package:my_app_despesas/pages/login/login.dart';
import 'package:my_app_despesas/pages/register/register.dart';

class Menu extends StatefulWidget {
  final Map<String, dynamic>? data;
  const Menu({super.key, required this.data});

  @override
  State<Menu> createState() => _MenuState();
}

int _currentIndex = 0;

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final List _pages = [
      const Expenses(),
      const Register(),
      const Login(),
    ];

    _ontapedItem(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _ontapedItem,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Pagina',
            icon: Icon(
              Icons.pages,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Login',
            icon: Icon(
              Icons.login,
            ),
          )
        ],
      ),
    );
  }
}
