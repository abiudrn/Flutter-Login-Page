import 'package:flutter/material.dart';
import 'package:flutter_login_page/stores/user/user_store.dart';
import 'package:provider/provider.dart';

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
    final store = Provider.of<UserStore>(context);

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
              RaisedButton(
                onPressed: () {
                  validateAndSubmit(store);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
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

  void validateAndSubmit(UserStore store) async {
    if (validateAndSave()) {
      try {
        store.signInWithEmailAndPassword(_email, _password);
      } catch (error) {
        print(error);
      }
    }
  }
}
