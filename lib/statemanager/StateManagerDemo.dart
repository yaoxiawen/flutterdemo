import 'package:flutter/material.dart';

import 'MixManagerPage.dart';
import 'SelfManagerPage.dart';
import 'SuperManagerPage.dart';

class StateManagerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("YXW StateManager Demo"),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelfManagerPage()));
                },
                child: Text("Widget管理自身状态"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SuperManagerPage()));
                },
                child: Text("父Widget管理子Widget的状态"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MixManagerPage()));
                },
                child: Text("混合状态管理"),
              )
            ],
          ),
        ));
  }
}
