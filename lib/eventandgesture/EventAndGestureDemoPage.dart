import 'package:flutter/material.dart';

import 'EventDemo.dart';
import 'GestureArena.dart';
import 'GestureDemo.dart';

//Flutter中的手势系统有两个独立的层。
//第一层为原始指针(pointer)事件，它描述了屏幕上指针（例如，触摸、鼠标和触控笔）的位置和移动。
//第二层为手势，描述由一个或多个指针移动组成的语义动作，如拖动、缩放、双击等。
class EventAndGestureDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW EventAndGesture Demo"),
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
                    builder: (context) => EventDemo(title: "YXW EventDemo",),
                  ),
                );
              },
              child: Text("EventDemo"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GestureDemo(title: "YXW GestureDemo",),
                  ),
                );
              },
              child: Text("GestureDemo"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GestureArena(title: "YXW GestureArena",),
                  ),
                );
              },
              child: Text("手势竞争与冲突"),
            ),
          ],
        ),
      ),
    );
  }
}