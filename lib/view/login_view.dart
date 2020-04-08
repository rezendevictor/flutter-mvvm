import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/controler/login_controller.dart';
import 'package:mvvm/repositories/login_repository.dart';
import 'package:mvvm/stores/app.store.dart';
import 'package:mvvm/view/entry_view.dart';
import 'package:mvvm/viewmodel/singup_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SingupViewState();
}

class _SingupViewState extends State<LoginView> {
  final _formkey = GlobalKey<FormState>();
  final _controller = new LoginControler();
  var model = new SingupViewModel();
  var preenchido = false;

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 80, 10, 20),
              width: 200.0,
              height: 200.0,
              child: Icon(
                Icons.all_out,
                size: 100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Text("Login"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nome",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            preenchido = false;
                            return "Nome Inválido";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          preenchido = true;
                          model.name = val;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            preenchido = false;
                            return "E-mail Inválido";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          preenchido = true;
                          model.email = val;
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            preenchido = false;
                            return "Senha Inválido";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          preenchido = true;
                          model.password = val;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: model.busy
                        ? Center(
                            child: Container(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.black,
                              ),
                            ),
                          )
                        : Column(
                            children: <Widget>[
                              Container(
                                width: 200,
                                height: 50,
                                child: RaisedButton(
                                  color: Colors.deepPurpleAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0)),
                                  child: Text(
                                    "Cadastrar",
                                    textScaleFactor: 1.4,
                                  ),
                                  onPressed: () {
                                    if (_formkey.currentState.validate()) {
                                      _formkey.currentState.save();
                                    }
                                    if (preenchido) {
                                      setState(() {
                                        _controller.create(model).then((data) {
                                          setState(() {});
                                          store.setUser(data.name, data.email,
                                              data.picture, data.token);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Entry(),
                                            ),
                                          );
                                        });
                                      });
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  child: RaisedButton(
                                    color: Colors.deepPurpleAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(18.0)),
                                    child: Text(
                                      "Login com Google",
                                      textScaleFactor: 1.4,
                                    ),
                                    onPressed: () {
                                      final snackBar = SnackBar(
                                        content:
                                            Text("Não implementado ainda."),
                                        backgroundColor: Colors.red,
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
