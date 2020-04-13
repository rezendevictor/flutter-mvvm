import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/viewmodel/expenseList_viewmodel.dart';

class DrawerElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50),
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage("photoUrl"),
            backgroundColor: Colors.blueAccent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("displayName"),
          ),
          _placeHolder(),
          _expensesAcess(context),
        ],
      ),
    );
  }

  Widget _placeHolder() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.wb_incandescent),
          title: Text('Necessidades'),
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('Quereres'),
        ),
        ListTile(
          leading: Icon(Icons.account_balance),
          title: Text('Economias'),
        ),
      ],
    );
  }
}

Widget _expensesAcess(BuildContext context) {
  return ListTile(
    leading: Icon(Icons.account_balance_wallet),
    title: Text('Lista de Despesas'),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExpenseList(),
        ),
      );
    },
  );
}
