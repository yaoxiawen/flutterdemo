import 'package:flutter/material.dart';
import 'ListViewDemo3.dart';
import 'ListViewDemo.dart';
import 'ListViewDemo2.dart';
import 'ListViewDemo4.dart';

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
                          builder: (context) => ListViewDemo(title: "一个简单例子")));
                },
                child: Text("一个简单例子"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListViewDemo2(title: "默认构造函数")));
                },
                child: Text("默认构造函数"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListViewDemo3(title: "ListView.builder")));
                },
                child: Text("ListView.builder"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListViewDemo4(title: "ListView.separated")));
                },
                child: Text("ListView.separated"),
              ),
            ],
          ),
        ));
  }
}
