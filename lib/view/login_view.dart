import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/controler/login_controller.dart';
import 'package:mvvm/viewmodel/singup_viewmodel.dart';

class LoginView extends StatefulWidget {


  @override
  State<StatefulWidget> createState() =>_SingupViewState();

}
class _SingupViewState extends State<LoginView>{
  final _formkey = GlobalKey<FormState>();
  final _controller = new LoginControler();
  var model = new SingupViewModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 80, 10, 20),
              width: 200.0,
              height: 200.0,
              child: Icon(Icons.all_out,size:100,),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Text("Cadastro"),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Nome Inválido";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        model.name = val;
                      }),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "E-mail Inválido";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        model.email = val;
                      }),
                  TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Senha Inválido";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        model.password = val;
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RaisedButton(
                      child: Text("Cadastrar"),
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          _formkey.currentState.save();
                        }

                        _controller.create(model).then((data){
                          print(data.email);
                          print(data.name);
                        });
                      },
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
