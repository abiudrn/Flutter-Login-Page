import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/models/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/auth_state_model.dart';

enum FormType { login, signup }

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  return value == null ? "ivalid password" : null;
                },
                onSaved: (value) => _password = value,
              ),
              SizedBox(
                height: 12,
              ),
              ScopedModelDescendant<AppModel>(
                builder: (BuildContext context, Widget child, model) {
                  return RaisedButton(
                    onPressed: () {
                      validateAndSubmit(model);
                    },
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

  void validateAndSubmit(AppModel model) async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = (await model.auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        ))
            .user;
        print('Signed in: ${user.uid}');
        model.setStatus(AuthStatus.signedIn);
      } catch (error) {
        print(error);
      }
    }
  }
}
