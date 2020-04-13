import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/tootlbox.dart';
import 'package:mvvm/view/transaction_view.dart';
import 'package:mvvm/view/view_elements/drawer_element.dart';
import 'package:mvvm/view/view_elements/extractData_element.dart';
import 'package:mvvm/view/view_elements/piechart_element.dart';
import 'package:mvvm/view/view_elements/text_display_element.dart';
import 'package:provider/provider.dart';

class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: DrawerElement(),
      body: ListView(
        children: <Widget>[
          _pieChart(store),
          _textCards(store),
        ],
      ),
      floatingActionButton: _floating(),
    );
  }

  Widget _pieChart(var store) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 400.0,
      height: 400.0,
      child: store.voltaLista().isEmpty
          ? DonutPieChart.withSampleData()
          : ExtractedData(store.voltaLista()),
    );
  }

  Widget _floating() {
    return FloatingActionButton(
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
    );
  }

  Widget _textCards(var store) {
    return Column(
      children: <Widget>[
        TextCard(
            icon: Icons.wb_incandescent,
            titulo: "Necessidades",
            valor: toolbox.somador(
              "NECESSIDADES",
              store.voltaLista(),
            )),
        TextCard(
            icon: Icons.monetization_on,
            titulo: "Quereres",
            valor: toolbox.somador(
              "QUERERES",
              store.voltaLista(),
            )),
        TextCard(
            icon: Icons.account_balance,
            titulo: "Economias",
            valor: toolbox.somador(
              "ECONOMIAS",
              store.voltaLista(),
            )),
      ],
    );
  }
}
