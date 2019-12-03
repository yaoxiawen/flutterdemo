import 'package:flutter/material.dart';

//前面两个例子里addListener()和setState() 来更新UI这一步其实是通用的，
//AnimatedWidget类封装了调用setState()的细节，并允许将widget分离出来
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        "images/timg.jpeg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class AnimatedWidgetDemo extends StatefulWidget {
  @override
  _AnimatedWidgetState createState() {
    return _AnimatedWidgetState();
  }
}

//需要实现TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _AnimatedWidgetState extends State<AnimatedWidgetDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  void dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget Demo"),
      ),
      body: AnimatedImage(
        animation: animation,
      ),
    );
  }
}
