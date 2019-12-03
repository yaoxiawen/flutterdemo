import 'package:flutter/material.dart';

import 'AnimatedWidgetDemo.dart';
import 'CurveAnimationDemo.dart';
import 'ScaleAnimationDemo.dart';

class AnimationDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Animation Demo"),
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
                    builder: (context) => ScaleAnimationDemo(),
                  ),
                );
              },
              child: Text("ScaleAnimation"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CurveAnimationDemo(),
                  ),
                );
              },
              child: Text("CurveAnimation"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimatedWidgetDemo(),
                  ),
                );
              },
              child: Text("AnimatedWidget"),
            ),
          ],
        ),
      ),
    );
  }
}