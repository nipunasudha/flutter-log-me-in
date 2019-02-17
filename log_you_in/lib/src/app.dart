import 'package:flutter/material.dart';
import 'package:log_you_in/src/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LogYouIn!",
      home: Scaffold(
        appBar: AppBar(
          title: Text("LogYouIn!"),
        ),
        body: LoginScreen(),
      ),
    );
  }
}
