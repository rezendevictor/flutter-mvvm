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
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("displayName"),
          ),
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
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Lista de Despesas'),
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => ExpenseList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
