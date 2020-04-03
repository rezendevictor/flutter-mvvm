import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/view/view_elements/expenseCard_template.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
import 'package:provider/provider.dart';

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  List<ExpenseAddition> cardInfos = [];

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    cardInfos = store.voltaLista();
    List<Widget> cardWidget = [];

    for (ExpenseAddition expense in cardInfos) {
      cardWidget.add(ExpenseCard(expense));
    }

    return Scaffold(
      appBar: AppBar(title: Text("Lista Despesas")),
      body: ListView.builder(
        itemCount: cardWidget.length,
          itemBuilder: (context,index){
           return cardWidget[index];
          },
      )

    );
  }
}
