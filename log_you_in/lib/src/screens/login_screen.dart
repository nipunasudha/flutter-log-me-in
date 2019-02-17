import 'package:flutter/material.dart';
import 'package:log_you_in/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> with ValidationMixin {
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
      validator: validatePassword,
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
      validator: validatePassword,
      onSaved: (value) => email = value,
    );
  }
}
