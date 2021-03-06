import 'package:flutter/material.dart';

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}

class MyNotificationDemo extends StatefulWidget {
  final String title;

  MyNotificationDemo({Key key, this.title}) : super(key: key);

  @override
  MyNotificationState createState() {
    return MyNotificationState();
  }
}

class MyNotificationState extends State<MyNotificationDemo> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //代码中注释的部分是不能正常工作的，因为这个context是根Context，
              //而NotificationListener是监听的子树，所以我们通过Builder来构建RaisedButton，来获得按钮位置的context。
              // 这是一种常用的缩小`context`范围的方式
//          RaisedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
              Builder(
                builder: (context) {
                  return RaisedButton(
                    //Notification有一个dispatch(context)方法，它是用于分发通知的，
                    //我们说过context实际上就是操作Element的一个接口，它与Element树上的节点是对应的，通知会从context对应的Element节点向上冒泡。
                    //按钮点击时分发通知
                    onPressed: () => MyNotification("Hi").dispatch(context),
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}
