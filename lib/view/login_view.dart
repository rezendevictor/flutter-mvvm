import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(50),
              child:Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    Text("Cadastro"),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText:"Name",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )
                      ),
                    ),


                  ],
                ),
              ),
            ),
        ),
      ],
    );
  }
}
