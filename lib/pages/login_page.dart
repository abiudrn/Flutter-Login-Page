import 'package:flutter/material.dart';
import 'package:flutter_login_page/actions/auth_actions.dart';
import 'package:flutter_login_page/models/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum FormType { login, signup }

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";
  // FormType _formType = FormType.login;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email;
    String password;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  return value == null ? "ivalid email" : null;
                },
                onSaved: (value) => email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  return value == null ? "ivalid password" : null;
                },
                onSaved: (value) => password = value,
              ),
              SizedBox(
                height: 12,
              ),
              StoreConnector<AppState, VoidCallback>(
                converter: (Store store) {
                  return () {
                    if (validateAndSave()) {
                      store.dispatch(Login(email: email, password: password));
                    } else {
                      print("error");
                    }
                  };
                },
                builder: (BuildContext context, callback) {
                  return RaisedButton(
                    onPressed: callback,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
              FlatButton(
                child: Text(
                  "Signup",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // void validateAndSubmit() async {
  //   if (validateAndSave()) {

  //   }
  // }
}
