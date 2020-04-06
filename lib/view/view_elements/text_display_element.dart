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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    leading: Icon(icon),
                    title: Text(titulo),
                    trailing: Text(valor.toString())),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

