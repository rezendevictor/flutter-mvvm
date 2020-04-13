import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/tootlbox.dart';
import 'package:mvvm/view/view_elements/expenseCard_template.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
import 'package:provider/provider.dart';

class SpecificList extends StatefulWidget {
  final String filter;

  const SpecificList(this.filter);

  @override
  _SpecificListState createState() => _SpecificListState(filter);
}

class _SpecificListState extends State<SpecificList> {
  final String filter;

  _SpecificListState(this.filter);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    List<ExpenseAddition> cardInfos =
        Toolbox.filter(store.voltaLista(), filter);
    List<Widget> cardWidget = [];

    for (ExpenseAddition expense in cardInfos) {
      cardWidget.add(ExpenseCard(expense));
    }

    return Scaffold(
        appBar: AppBar(title: Text("Lista Despesas")),
        body: Column(
          children: <Widget>[
            _topCard(filter),
            _scrollCards(context, cardWidget)
          ],
        ));
  }

  Widget _scrollCards(BuildContext context, List<Widget> cardWidget) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: cardWidget.length,
        itemBuilder: (context, index) {
          return cardWidget[index];
        },
      ),
    );
  }

  Widget _topCard(String filter){

    return Card(
      child: ListTile(
        leading: Icon(Icons.all_out),
        title: Text("Total"),
      ),
    );
  }


}
