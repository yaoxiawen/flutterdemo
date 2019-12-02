import 'package:flutter/material.dart';
import 'package:flutter_app/scrolldemo/ScrollNotificationDemo.dart';

import 'MyNotificationDemo.dart';
import 'NotificationListenerDemo.dart';

class NotificationDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Notification Demo"),
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
                    builder: (context) =>
                        NotificationListenerDemo(),
                  ),
                );
              },
              child: Text("NotificationListener"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScrollNotificationDemo(title: "ScrollNotification "
                            "Demo"),
                  ),
                );
              },
              child: Text("ScrollNotification"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyNotificationDemo(title: "MyNotification Demo"),
                  ),
                );
              },
              child: Text("自定义Notification"),
            )
          ],
        ),
      ),
    );
  }
}