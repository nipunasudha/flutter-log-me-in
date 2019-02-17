import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildUsernameField(),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              buildPasswordField(),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              buildSubmitButton()
            ],
          )),
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Submit"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print("Submitted username: $email & password: $password");
        }
      },
      shape: StadiumBorder(),
      color: Colors.deepPurpleAccent,
      textColor: Colors.white,
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Password",
      ),
      obscureText: true,
      validator: (text) {
        return text.length > 4
            ? null
            : "Password must be at least 4 characters long";
      },
      onSaved: (value) => email = value,
    );
  }

  TextFormField buildUsernameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "you@example.com",
      ),
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      validator: (text) {
        return text.contains("@") ? null : "Username must be a valid email";
      },
      onSaved: (value) => email = value,
    );
  }
}
