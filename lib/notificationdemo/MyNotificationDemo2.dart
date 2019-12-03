import 'package:flutter/material.dart';

class MyNotification2 extends Notification {
  MyNotification2(this.msg);

  final String msg;
}

class MyNotificationDemo2 extends StatefulWidget {
  final String title;

  MyNotificationDemo2({Key key, this.title}) : super(key: key);

  @override
  MyNotificationState2 createState() {
    return MyNotificationState2();
  }
}

class MyNotificationState2 extends State<MyNotificationDemo2> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: NotificationListener<MyNotification2>(
        onNotification: (notification) {
          print(notification.msg); //打印通知
          return true;
        },
        child: NotificationListener<MyNotification2>(
          onNotification: (notification) {
            setState(() {
              _msg += notification.msg + "  ";
            });
            //当返回值为true时，阻止冒泡，其父级Widget将再也收不到该通知；
            //当返回值为false 时继续向上冒泡通知。
            return false;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => MyNotification2("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
