import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Spinner extends StatefulWidget {
  final valorSel;
  Spinner(this.valorSel);
  @override
  _SpinnerState createState() => _SpinnerState(valorSel);
}

class _SpinnerState extends State {
  var selected;

  _SpinnerState(this.selected);

  List<String> spinnerItems = [
    "RECEBIDOS",
    "NECESSIDADES",
    "QUERERES",
    "ENCONOMIAS",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DropdownButton<String>(
        hint: Text("CATEGORIA"),
        value: selected,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 8,
        style: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: 16,
        ),
        underline: Container(
          height: 2,
          child: Text("Categoria"),
        ),
        onChanged: (String data) {
          setState(() {
            selected = data;
          });
        },
        items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ]);
  }
}
