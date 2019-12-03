import 'package:flutter/material.dart';

class ScaleAnimationDemo extends StatefulWidget {
  @override
  _ScaleAnimationState createState() {
    return _ScaleAnimationState();
  }
}

//需要实现TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationState extends State<ScaleAnimationDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    //图片宽高从0变到300
    //addListener()函数调用了setState()，
    //所以每次动画生成一个新的数字时，当前帧被标记为脏(dirty)，
    //这会导致widget的build()方法再次被调用，
    //而在build()中，改变Image的宽高，因为它的高度和宽度现在使用的是animation.value ，所以就会逐渐放大。
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
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
        title: Text("ScaleAnimation Demo"),
      ),
      body: Center(
        child: Image.asset(
          "images/timg.jpeg",
          width: animation.value,
          height: animation.value,
        ),
      ),
    );
  }
}
