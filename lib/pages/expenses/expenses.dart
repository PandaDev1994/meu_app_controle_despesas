import 'package:flutter/material.dart';
import 'package:my_app_despesas/doc/api/expense/expenses_api.dart';
import 'package:my_app_despesas/models/models_expenses.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

String? selectedOption;
List<ModelsExpenses> expenses = [];

Future<int?> getUserFromPreferences() async {
  final prefs = await SharedPreferences.getInstance();

  int? userId = prefs.getInt('id');

  return userId;
}

class _ExpensesState extends State<Expenses> {
  Future<void> getCategories() async {
    ExpensesApi expensesApi = ExpensesApi();

    int? userId = await getUserFromPreferences();

    List<ModelsExpenses> loadExpenses =
        await expensesApi.listExpensesById(userId!);

    setState(() {
      loadExpenses;
    });
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          expenses.isEmpty
              ? Center(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: ListView.builder(
                      itemCount: expenses.length,
                      itemBuilder: (context, index) {
                        var expenseList = expenses[index];

                        print(expenseList);
                        return Container(
                          width: 50,
                          height: 50,
                          color: Colors.blueAccent,
                          alignment: Alignment.center,
                          child: Text(expenseList.description ?? 'erro'),
                        );
                      },
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.blueGrey,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  DropdownButton<String> drop() {
    return DropdownButton<String>(
      value: selectedOption,
      hint: const Text('Selecione uma opção'),
      items: expenses.map((expense) {
        return DropdownMenuItem<String>(
          value: expense.description,
          child: Text(expense.description ?? 'sem descrição'),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedOption = newValue;
        });
      },
    );
  }
}
