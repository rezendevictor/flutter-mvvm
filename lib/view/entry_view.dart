import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/view/transaction_view.dart';
import 'package:mvvm/view/view_elements/drawer_element.dart';
import 'package:mvvm/view/view_elements/piechart_element.dart';
import 'package:mvvm/view/view_elements/text_display_element.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class Entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(title: Text("MVVM")),
      drawer: DrawerElement(),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            width: 400.0,
            height: 400.0,
            child: DonutPieChart(_createSampleData()),
          ),
          TextCard(titulo: "Necessidades", valor: 200),
          TextCard(titulo: "Quereres", valor: 200),
          TextCard(titulo: "Economias", valor: 200),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline,size: 55,),
        backgroundColor: (Colors.deepPurpleAccent),
        onPressed:(){
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

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
