import 'dart:convert';
import 'dart:developer';
import 'dart:js';

import 'package:expense_crud/controller/services/expense_services.dart';
import 'package:expense_crud/models/expense_model.dart';
import 'package:expense_crud/view/add_expense.dart';
import 'package:expense_crud/view/view_expenses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseProvider extends ChangeNotifier{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

   TextEditingController get nameController => _nameController;
  TextEditingController get amountController => _amountController;
  final GlobalKey<FormState> formFieldKey = GlobalKey();
  final _service = ExpenseService();
  bool isLoading = false;
  List<Expense> _expense = [];

  // get message => Data.fromJson(message);

  // get id => Expense(id: id);

  void submitData() async{

     if(formFieldKey.currentState!.validate()){
       Expense newExpense = Expense(
         name: nameController.text,
         amount: int.tryParse(amountController.text),
       );
       // Data(status: true, message: message);
       print("Adding ${newExpense.amount}");
       await ExpenseService().createExpense(nameController.text, amountController.text, );
     }
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(content: Text('Expense created')));

     // Navigator.pop(context as BuildContext);
     }

  // void deleteData() async{
  //
  //   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (_)=> ViewExpense()));
  //
  //   Expense newExpense = Expense(
  //     id: id
  //   );
  //     // print("Adding ${newExpense.amount}");
  //     await ExpenseService().deleteExpense(id);
  //     ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(content: Text('Expense created')));
  //   }
    // Navigator.pop(context as BuildContext);
  }
