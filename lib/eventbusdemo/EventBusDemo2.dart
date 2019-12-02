import 'package:flutter/material.dart';
import 'package:flutter_app/eventbusdemo/EventBus.dart';
import 'EventBusDemo3.dart';

class EventBusDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW EventBusDemo2"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                bus.emit("login");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventBusDemo3(),
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
