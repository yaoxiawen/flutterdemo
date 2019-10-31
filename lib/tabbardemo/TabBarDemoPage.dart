import 'package:flutter/material.dart';
import 'TabBarBottomPageWidget.dart';
import 'TabBarTopPageWidget.dart';

class TabBarDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("YXW TabBar Demo"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TabBarTopPageWidget()));
                },
                child: Text("Top Tab Bar"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TabBarBottomPageWidget()));
                },
                child: Text("Bottom Tab Bar"),
              ),
            ],
          ),
        ));
  }
}
