import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/view/transaction_view.dart';
import 'package:mvvm/view/view_elements/drawer_element.dart';
import 'package:mvvm/view/view_elements/extractData_element.dart';
import 'package:mvvm/view/view_elements/piechart_element.dart';
import 'package:mvvm/view/view_elements/text_display_element.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mvvm/viewmodel/expenseList_viewmodel.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
import 'package:provider/provider.dart';
class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var store = Provider.of<AppStore>(context);
    ExtractedData data = new ExtractedData(store.voltaLista());

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: DrawerElement(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 400.0,
            height: 400.0,
            child: store
                .voltaLista()
                .isEmpty
                ? DonutPieChart.withSampleData()
                : ExtractedData(store.voltaLista()),
          ),
          TextCard(icon:Icons.wb_incandescent,titulo: "Necessidades", valor: somador("NECESSIDADES", store.voltaLista())),
          TextCard(icon:Icons.monetization_on,titulo: "Quereres", valor: somador("QUERERES", store.voltaLista())),
          TextCard(icon:Icons.account_balance,titulo: "Economias", valor:somador("ECONOMIAS", store.voltaLista())),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_circle_outline,
          size: 55,
        ),
        backgroundColor: (Colors.deepPurpleAccent),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Transaction(),
            ),
          );
        },
      ),
    );
  }

  double somador(String nome, List<ExpenseAddition> lista){
    double resultado = 0;
    for(ExpenseAddition x in lista ){
      if(x.type == nome){
        resultado += double.parse(x.value);
      }
    }
    return resultado;

  }

}
