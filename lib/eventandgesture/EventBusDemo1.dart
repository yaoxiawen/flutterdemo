import 'package:flutter/material.dart';
import 'package:flutter_app/eventandgesture/EventBus.dart';
import 'package:flutter_app/eventandgesture/EventBusDemo2.dart';

class EventBusDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bus.on("login", (arg) {
      print("EventBusDemo1 has logined");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("YXW EventBusDemo1"),
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
                    builder: (context) => EventBusDemo2(),
                  ),
                );
              },
              child: Text("跳转"),
            ),
          ],
        ),
      ),
    );
  }
}
