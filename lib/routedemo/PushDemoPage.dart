import 'package:flutter/material.dart';

class PushDemoPage extends StatelessWidget {
  final String title;

  PushDemoPage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Navigator.push Demo"),
      ),
      body: Center(
        child: Text("come from push: $title"),
      ),
    );
  }
}
