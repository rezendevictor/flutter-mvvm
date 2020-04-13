import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/viewmodel/expenseaddition.viewmodel.dart';
import 'package:provider/provider.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  bool preenchido = false;

  final _formkey = GlobalKey<FormState>();

  var nTransaction = new ExpenseAddition();

  final TextEditingController _controllerTitulo = new TextEditingController();
  final TextEditingController _controllerValor = new TextEditingController();

  String selected;

  List<String> spinnerItems = [
    "RECEBIDOS",
    "NECESSIDADES",
    "QUERERES",
    "ENCONOMIAS",
  ];
  String textoData = "vazio";

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
                      _tituloField(),
                      _valorField(),
                      _dataField(),
                      _categorySpinner(),
                      _button(store),
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

  Widget _tituloField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 50, 32, 32),
      child: TextFormField(
        controller: _controllerTitulo,
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
    );
  }

  Widget _valorField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: TextFormField(
        controller: _controllerValor,
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
    );
  }

  Widget _dataField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Selecione a data:",
            textScaleFactor: 1.4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: ButtonTheme(
            height: 60,
            minWidth: 150,
            child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.grey, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 0.8, //width of the border
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1), onConfirm: (date) {
                    setState(() {
                      textoData = ' ${date.day} / ${date.month} / ${date.year} ';
                      nTransaction.data = date;
                      preenchido = true;
                    });
                  }, currentTime: DateTime.now(), locale: LocaleType.pt);
                },
                child: textoData == "vazio"
                    ? Text(
                        "Data",
                        textScaleFactor: 1.4,
                      )
                    : Text(
                        textoData,
                        textScaleFactor: 1.4,
                      )),
          ),
        ),
      ],
    );
  }

  Widget _categorySpinner() {
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
            nTransaction.type = data;
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

  Widget _button(var store) {
    return Padding(
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

              debugPrint(store.expenseData[0].title);
            },
            child: Text("Adicionar")),
      ),
    );
  }
}
