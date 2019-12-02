import 'package:flutter/material.dart';
import 'package:flutter_app/eventandgesture/EventBus.dart';
import 'package:flutter_app/eventandgesture/EventBusDemo2.dart';

class EventBusDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bus.on("login", (arg) {
      print("EventBusDemo3 has logined");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("YXW EventBusDemo3"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
              },
              child: Text("跳转"),
            ),
          ],
        ),
      ),
    );
  }
}
