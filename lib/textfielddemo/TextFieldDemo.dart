import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget{
  @override
  TextFieldState createState() {
    return TextFieldState();
  }
}

class TextFieldState extends State<TextFieldDemo>{
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
            ],
          )),
    );
  }
}