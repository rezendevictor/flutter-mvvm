import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[TextFormField()],
                ),
              )),
        ],
      ),
    );
  }
}
