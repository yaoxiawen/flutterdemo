import 'package:flutter/material.dart';

class PopDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Pop Demo"),
      ),
      body: Center(
        child: FlatButton(
            //有两种方式可以返回到上一页；
            //第一种方式时直接点击导航栏返回箭头，第二种方式是点击页面中的“返回”按钮。
            //这两种返回方式的区别是前者不会返回数据给上一个路由，而后者会。
            onPressed: () => Navigator.pop(context, "这是返回值"),
            child: Text("Pop返回")),
      ),
    );
  }
}
