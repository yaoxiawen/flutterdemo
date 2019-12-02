import 'package:flutter/material.dart';

//Flutter Widget树中子Widget可以通过发送通知（Notification）与父(包括祖先)Widget通信。
//父级组件可以通过NotificationListener组件来监听自己关注的通知。
//可滚动组件在滚动时会发送ScrollNotification类型的通知，ScrollBar正是通过监听滚动通知来实现的。
class ScrollNotificationDemo extends StatefulWidget {
  final String title;

  ScrollNotificationDemo({Key key, this.title}) : super(key: key);

  @override
  ScrollNotificationState createState() {
    return ScrollNotificationState();
  }
}

class ScrollNotificationState extends State<ScrollNotificationDemo> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        //进度条，Scrollbar失效了，不知道为什么
        child: NotificationListener<ScrollNotification>(
          //监听滚动通知
          onNotification: (notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            return true;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (context, index) => ListTile(
                  title: Text("$index"),
                ),
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.greenAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
