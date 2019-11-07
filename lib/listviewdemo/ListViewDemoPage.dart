import 'package:flutter/material.dart';
import 'ListViewDemo3.dart';
import 'ListViewDemo.dart';
import 'ListViewDemo2.dart';

class ListViewDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("YXW ListView Demo"),
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
                          builder: (context) => ListViewDemo()));
                },
                child: Text("demo1"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListViewDemo2()));
                },
                child: Text("demo2"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListViewDemo3()));
                },
                child: Text("demo3"),
              ),
            ],
          ),
        ));
  }
}
