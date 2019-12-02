import 'package:flutter/material.dart';

class NotificationListenerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationListener Demo"),
      ),
      body: NotificationListener(
        onNotification: (notification) {
          switch (notification.runtimeType){
            case ScrollStartNotification: print("开始滚动"); break;
            case ScrollUpdateNotification: print("正在滚动"); break;
            case ScrollEndNotification: print("滚动停止"); break;
            case OverscrollNotification: print("滚动到边界"); break;
          }
          return true;
        },
        child: ListView.builder(
          itemCount: 50,
          itemExtent: 50,
          itemBuilder: (context, index) => ListTile(
            title: Text("$index"),
          ),
        ),
      ),
    );
  }
}
