import 'package:flutter/material.dart';

class PushNamedDemoPage extends StatelessWidget {
  final String title;

  PushNamedDemoPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取pushNamed方法的路由参数
    var args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW pushNamed Demo"),
      ),
      body: Center(
        child: Text("come from pushNamed:$args,$title"),
      ),
    );
  }
}
