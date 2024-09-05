import 'dart:developer';

import 'package:expense_crud/models/expense_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ExpenseService{
  String baseUrl = "https://expense-d2gh.onrender.com/api/";
  getAllExpenses() async {
    try{
      List<Expense> allExpense = [];
      var response = await http.get(Uri.parse(baseUrl + "expense/all-expense"));
      if(response.statusCode == 200 || response.statusCode == 201){
        var data = response.body;
        var jsonData = jsonDecode(data);
        print(jsonData);
        for(var expense in jsonData){
          Expense newExpense = Expense.fromJson(expense);
          allExpense.add(newExpense);
        }
         return allExpense;
      } else{
        throw Exception('error ${response.statusCode}');
      }
    }catch(e){}
  }

  createExpense( String? name, String? amount) async{
    log('create exp is called');
    Map<String, String> headers = {
      'content-Type': 'application/json',
      'Charset':'utf-8'
    };
    final model = {
      "name": name,
      "amount": int.tryParse(amount.toString()),
    };
    print(model.toString());
    try{
      var response = await http.post(Uri.parse("${baseUrl}expense/add-expense"),
          body: json.encode(model), headers: headers
      );
      log('The response is ${response.body}');
      if(response.statusCode == 200 || response.statusCode == 201){
        print("Success ${response.body}");
      }else{
        throw Exception('error ${response.statusCode} and ${response.body}');
      }
    }catch(e){
    print("Error occured: ${e.toString()}");
    }
  }

  editExpense(Expense expense) async{
    try{

    }catch(e){

    }
  }

  deleteExpense(String? id) async{
    try{
      var response = await http.delete(Uri.parse("${baseUrl}remove-expense/${id}"),);
          if(response.statusCode == 204 || response.statusCode == 201){
        print("Successful delete ${response.body}");
      }else{
    throw Exception('error ${response.statusCode} and ${response.body}');
    }

    }catch(e){

    }
  }
  // Future<List<Expense>> Data async {
  //   const baseUrl ='https://expense-d2gh.onrender.com';
  //   final addExpense = ' $baseUrl/api/expense/add-expense';
  //   final uri = Uri.parse(addExpense);
  //   final response = await http.post(uri);
  //
  //   if(response.statusCode == 200){
  //     final json = jsonEncode(reponse.Data)
  // }

//}



}