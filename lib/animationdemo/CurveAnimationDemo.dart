import 'package:flutter/material.dart';

class CurveAnimationDemo extends StatefulWidget {
  @override
  _CurveAnimationState createState() {
    return _CurveAnimationState();
  }
}

//需要实现TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _CurveAnimationState extends State<CurveAnimationDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    //比上一个例子中增加使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    //animate方法中要改为传入animation，已经增加了curve
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
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
        title: Text("CurveAnimation Demo"),
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
