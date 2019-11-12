import 'package:flutter/material.dart';

import 'FutureBuilderDemo.dart';
import 'StreamBuilderDemo.dart';

/**
 * enum ConnectionState {
    ///当前没有异步任务，比如[FutureBuilder]的[future]为null时
    none,

    ///异步任务处于等待状态
    waiting,

    ///Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态,ConnectionState.active只在StreamBuilder中才会出现。
    active,

    ///异步任务已经终止.
    done,
    }
 */
class AsynUIUpdateDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW AsynUIUpdate Demo"),
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
                    builder: (context) => FutureBuilderDemo(title: "FutureBuilder"),
                  ),
                );
              },
              child: Text("FutureBuilder"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamBuilderDemo(title: "StreamBuilder"),
                  ),
                );
              },
              child: Text("StreamBuilder"),
            ),
          ],
        ),
      ),
    );
  }
}