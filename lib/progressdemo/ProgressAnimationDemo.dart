import 'package:flutter/material.dart';

class ProgressAnimationDemo extends StatefulWidget {
  @override
  _ProgressAnimationState createState() {
    return _ProgressAnimationState();
  }
}

class _ProgressAnimationState extends State<ProgressAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //初始化时创建控制器,通过 with SingleTickerProviderStateMixin 实现动画效果。
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => {setState(() => {})});
    super.initState();
  }

  @override
  void dispose() {
    //页面销毁时，销毁控制器
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("YXW ProgressAnimation"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          ],
        ),
      ),
    );
  }
}
