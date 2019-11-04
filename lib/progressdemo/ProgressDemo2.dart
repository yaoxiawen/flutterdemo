import 'package:flutter/material.dart';

class ProgressDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Progress Demo2"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12),
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
            ),

            //value表示当前的进度，取值范围为[0,1]；
            //如果value为null时则指示器会执行一个循环动画（模糊进度）；
            //当value不为null时，指示器为一个具体进度的进度条。
            // 模糊进度条(会执行一个动画)
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            Container(
              height: 10,
            ),

            //进度条显示50%
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            Container(
              height: 10,
            ),

            // 模糊进度条(会执行一个旋转动画)
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            Container(
              height: 10,
            ),

            //进度条显示50%，会显示一个半圆
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
              strokeWidth: 6,
            ),
            Container(
              height: 10,
            ),

            //LinearProgressIndicator和CircularProgressIndicator都是取父容器的尺寸作为绘制的边界的。
            //通过尺寸限制类Widget，如ConstrainedBox、SizedBox来指定尺寸
            //线性进度条高度指定为3
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),
            Container(
              height: 10,
            ),
            // 圆形进度条长宽不一致，会呈现椭圆
            SizedBox(
              height: 80,
              width: 130,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
