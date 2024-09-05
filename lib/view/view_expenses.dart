import 'package:expense_crud/controller/services/expense_services.dart';
import 'package:expense_crud/models/expense_model.dart';
import 'package:expense_crud/view/add_expense.dart';
import 'package:flutter/material.dart';

class ViewExpense extends StatefulWidget {
  const ViewExpense({super.key});

  @override
  State<ViewExpense> createState() => _ViewExpenseState();
}

class _ViewExpenseState extends State<ViewExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
        body: FutureBuilder(future: ExpenseService().getAllExpenses(),
            builder: (context, snapshot) {
              if (snapshot.hasError){
              return Center(child: Text('Can not receive data'),);
            }
            if(snapshot.hasData) {
              var data = snapshot.data as List<Expense>;
              return Column(
                children: [
                  Center(child: Text('List of all Expenses'),),
                  SizedBox(height: 20,),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                      return Container(
                        color: Colors.green,
                        height: MediaQuery.of(context).size.height * 0.15,
                        // width: double.maxFinite,
                        child: Column(
                          children: [
                            Text(data[index].name!),
                             Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(data[index].amount.toString()),
                                Text(data[index].date.toString()),
                              ],
                            ),
                             Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                IconButton(onPressed: (){

                                }, icon: Icon(Icons.edit), color: Colors.black,),
                                IconButton(onPressed: (){
                                  showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      title: Text('Are you sure you want to delete expense'),
                                      actions: [
                                        ElevatedButton(onPressed: ()async{
                                          // var id = int.tryParse(data[index].id);
                                          await ExpenseService().deleteExpense(data[index].id);
                                          Navigator.pop(context);
                                        }, child: Text('Yes')),
                                        ElevatedButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text('No'))

                                      ],
                                    );
                                  }
                                  );
                                }, icon: Icon(Icons.delete), color: Colors.black,)

                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 50,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpense()));
                  }, child: Text('Add New Expenses'))
                ],
              );
            } else{
              return Center(child: CircularProgressIndicator(),);
            }
    }),
// https://expense-d2gh.onrender.com/api/expense/remove-expense
    );
  }
}
