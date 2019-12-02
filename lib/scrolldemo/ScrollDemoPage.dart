import 'package:flutter/material.dart';

import 'ScrollNotificationDemo.dart';
import 'ScrollControllerDemo.dart';

class ScrollDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Scroll Demo"),
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
                        ScrollControllerDemo(title: "ScrollController Demo"),
                  ),
                );
              },
              child: Text("ScrollController"),
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
              child: Text("NotificationDemo"),
            ),
          ],
        ),
      ),
    );
  }
}
