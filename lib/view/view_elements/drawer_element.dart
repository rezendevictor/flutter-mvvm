import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repositories/login_repository.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/viewmodel/expenseList_viewmodel.dart';
import 'package:provider/provider.dart';

class DrawerElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var store = Provider.of<AppStore>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50),
          ),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(store.user.photoUrl),
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(store.user.displayName),
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
