import 'package:expense_crud/controller/providers/expense_provider.dart';
import 'package:expense_crud/models/expense_model.dart';
import 'package:expense_crud/models/expense_model.dart';
import 'package:expense_crud/view/view_expenses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense'),),
      body: Consumer<ExpenseProvider>(
        builder: (context, Expense, child) {
          return Form(
            key: Expense.formFieldKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value){
                    if(value!.length == 0){
                      return 'Please enter the name of expense';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder()
                  ),
                  controller: Expense.nameController,
                ),
                SizedBox(height: 10,),

                TextFormField(
                  validator: (value){
                    if(value!.length == 0){
                      return 'Please enter the amount for expense';
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount'
                  ),
                  controller: Expense.amountController,
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  Expense.submitData();
                  Navigator.pop(context);
                }, child: Text('Add Expense'))
              ],
            ),
          );
        }
      ),

    );
  }
}
