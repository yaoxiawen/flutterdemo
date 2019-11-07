import 'package:flutter/material.dart';
import 'ProgressAnimationDemo.dart';
import 'ProgressDemo.dart';
import 'ProgressDemo2.dart';

class ProgressDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("YXW Progress Demo"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProgressDemo()));
                },
                child: Text("demo1"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProgressDemo2()));
                },
                child: Text("demo2"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProgressAnimationDemo()));
                },
                child: Text("progress animation"),
              ),
            ],
          ),
        ));
  }
}
