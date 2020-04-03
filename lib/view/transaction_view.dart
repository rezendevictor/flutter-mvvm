import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/ExpenseModel.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/view/view_elements/formFields_element.dart';
import 'package:mvvm/view/view_elements/spinner_element.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
import 'package:provider/provider.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  bool preenchido = true;

  final _formkey = GlobalKey<FormState>();

  var nTransaction = new ExpenseAddition();

  String selected;

  List<String> spinnerItems = [
    "RECEBIDOS",
    "NECESSIDADES",
    "QUERERES",
    "ENCONOMIAS",
  ];
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Transação"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 50, 32, 32),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Titulo",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              preenchido = false;
                              return "Titulo é Obrigatorio";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            preenchido = true;
                            nTransaction.title = val;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Valor",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              preenchido = false;
                              return "Valor é Obrigatorio";
                            }
                            return null;
                          },
                          onSaved: (val) {
                            preenchido = true;
                            nTransaction.value = val;
                          },
                        ),
                      ),

                      Column(children: <Widget>[
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
                              nTransaction.type = data;
                            });
                          },
                          items: spinnerItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ]),
                      //Seleciona a categoria ou o se é Income
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ButtonTheme(
                          minWidth: 200,
                          height: 50,
                          child: FlatButton(
                              color: Colors.deepPurpleAccent,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              splashColor: Colors.indigoAccent,
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  _formkey.currentState.save();
                                }
                                if (preenchido) {
                                  setState(() {
                                    nTransaction.registered = DateTime.now();
                                    store.addExpense(nTransaction);
                                    Navigator.pop(context);
                                  });
                                }

                                debugPrint(store.ExpenseData[0].title);
                              },
                              child: Text("Adicionar")),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
