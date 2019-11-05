import 'package:flutter/material.dart';

//alignment : 需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。
//AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset。
//widthFactor和heightFactor是用于确定Align组件本身宽高的属性；
// 它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。
//如果值为null，则组件的宽高将会占用尽可能多的空间。

//Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0)。
// x、y的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离，因此2个水平（或垂直）单位则等于矩形的宽（或高），
//如Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，
//而Alignment(1.0, -1.0) 则正是右侧顶点，即Alignment.topRight。
//为了使用方便，矩形的原点、四个顶点，以及四条边的终点在Alignment类中都已经定义为了静态常量。

//FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！
//FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致，优先使用FractionalOffset。
class AlignDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Align Demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 140,
            width: 140,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment.topRight,
              child: Text("align"),
            ),
          ),
          Container(
            height: 10,
          ),

          Container(
            height: 140,
            width: 140,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment(2.0, -1.0),
              child: Text("align"),
            ),
          ),
          Container(
            height: 10,
          ),

          Container(
            height: 140,
            width: 140,
            color: Colors.blue[50],
            child: Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: Text("align"),
            ),
          ),
        ],
      )
    );
  }
}
