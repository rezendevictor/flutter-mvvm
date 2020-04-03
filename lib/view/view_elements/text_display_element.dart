import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TextCard extends StatelessWidget {
  final String titulo;
  final double valor;
  final IconData icon;

  TextCard({this.titulo, this.valor, this.icon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(icon),
                title: Text(titulo),
                subtitle: Text(valor.toString())),
          ],
        ),
      ),
    );
  }


}

