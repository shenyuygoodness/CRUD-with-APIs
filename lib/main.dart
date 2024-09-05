import 'package:expense_crud/controller/providers/expense_provider.dart';
import 'package:expense_crud/view/view_expenses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ExpenseProvider>(create: (_) => ExpenseProvider()),
      ],
      child:  MaterialApp(
            debugShowCheckedModeBanner: false,
        home: ViewExpense(),
      ),
    );
  }
}

