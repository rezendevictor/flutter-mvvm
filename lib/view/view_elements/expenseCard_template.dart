import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';

class ExpenseCard extends StatelessWidget {
  final ExpenseAddition infos;

  const ExpenseCard(this.infos);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0)),
      child: ListTile(
        leading: Icon(
          _SelectIcon(infos.type),
        ),
        title: Text(infos.value),
        subtitle: Text(infos.title),
        trailing: Text(infos.data.toString()),
      ),
    );
  }
}

IconData _SelectIcon(String tipo) {
  if (tipo == "NECESSIDADES") {
    return Icons.wb_incandescent;
  } else if (tipo == "QUERERES") {
    return Icons.monetization_on;
  } else if (tipo == "ECONOMIAS") {
    return Icons.arrow_drop_down;
  } else {
    return Icons.trending_up;
  }
}
