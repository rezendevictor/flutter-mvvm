import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Define o Titulo da Despesa
class FormElement extends StatefulWidget {
  final BuildContext context;
  final nTransaction;
  final String label;
  final String erro;

  FormElement(this.context, this.nTransaction, this.label, this.erro);

  @override
  _FormElementState createState() =>
      _FormElementState(this.context, this.nTransaction, this.label, this.erro);
}

class _FormElementState extends State<FormElement> {
  final BuildContext context;
  var nTransaction;
  final String label;
  final String erro;

  _FormElementState(this.context, this.nTransaction, this.label, this.erro);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return erro;
        }
        return null;
      },
      onSaved: (val) {
        nTransaction = val;
      },
    );
  }
}
