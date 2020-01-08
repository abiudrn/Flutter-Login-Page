import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_page/auth.dart';
import 'package:flutter/material.dart';

enum FormType { login, signup }

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";

  final BaseAuth auth;
  final Function onSignedIn;

  LoginPage({this.auth, this.onSignedIn});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  FormType _formType = FormType.login;

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
              RaisedButton(
                onPressed: validateAndSubmit,
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
                onPressed: signupUser,
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

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = await widget.auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        print('Signed in: ${user.uid}');
        // Navigator.pushReplacementNamed(context, HomePage.routeName);
        widget.onSignedIn();
      } catch (error) {
        print(error);
      }
    }
  }

  void signupUser() {
    setState(() {
      _formType = FormType.signup;
    });
  }
}
