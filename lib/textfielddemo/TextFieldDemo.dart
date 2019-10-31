import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  TextFieldState createState() {
    return TextFieldState();
  }
}

class TextFieldState extends State<TextFieldDemo> {
  String _errorText='Here will have a Toast';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW TextField Demo"),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                onSubmitted: (String text) {
                  setState(() {
                    if (!isEmail(text)) {
                      _errorText = 'Error: This is not an email';
                    } else {
                      _errorText = 'Correct: This is an email';
                    }
                  });
                },
                decoration: InputDecoration(
                    hintText: "This is a hint", errorText: _errorText),
              )
            ],
          )
      ),
    );
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }
}
