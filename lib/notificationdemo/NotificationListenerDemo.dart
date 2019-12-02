import 'package:flutter/material.dart';

class NotificationListenerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationListener Demo"),
      ),
      body: getNotificationListener2(),
    );
  }

  Widget getNotificationListener1() {
    return NotificationListener(
      onNotification: (notification) {
        switch (notification.runtimeType) {
          //滚动通知如ScrollStartNotification、ScrollUpdateNotification等都是继承自ScrollNotification类，
          //不同类型的通知子类会包含不同的信息，比如ScrollUpdateNotification有一个scrollDelta属性，它记录了移动的位移
          case ScrollStartNotification:
            print("开始滚动");
            break;
          case ScrollUpdateNotification:
            print("正在滚动");
            break;
          case ScrollEndNotification:
            print("滚动停止");
            break;
          case OverscrollNotification:
            print("滚动到边界");
            break;
        }
        //当返回值为true时，阻止冒泡，其父级Widget将再也收不到该通知；
        //当返回值为false 时继续向上冒泡通知。
        return true;
      },
      child: ListView.builder(
        itemCount: 50,
        itemExtent: 50,
        itemBuilder: (context, index) => ListTile(
          title: Text("$index"),
        ),
      ),
    );
  }

  Widget getNotificationListener2() {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        //NotificationListener 可以指定一个模板参数，该模板参数类型必须是继承自Notification；当显式指定模板参数时，NotificationListener便只会接收该参数类型的通知。
        //只会在滚动结束时才会触发此回调
        print(notification);
        return true;
      },
      child: ListView.builder(
        itemCount: 50,
        itemExtent: 50,
        itemBuilder: (context, index) => ListTile(
          title: Text("$index"),
        ),
      ),
    );
  }
}
