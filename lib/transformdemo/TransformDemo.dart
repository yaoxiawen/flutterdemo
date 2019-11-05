import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Transform Demo"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12, right: 12, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。
            //Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作
            Container(
              color: Colors.black,
              child: new Transform(
                alignment: Alignment.topRight,
                transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                child: new Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
            Container(
              height: 20,
            ),

            //平移：Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离。
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: Offset(20.0, -5.0),
                child: Text("Hello world"),
              ),
            ),
            Container(
              height: 20,
            ),

            //旋转：Transform.rotate可以对子组件进行旋转变换。
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                //旋转90度
                //angle:math.pi/2 ,
                angle: 1.5, //弧度
                child: Text("Hello world"),
              ),
            ),
            Container(
              height: 20,
            ),

            //缩放：Transform.scale可以对子组件进行缩小或放大。
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5, //放大到1.5倍
                child: Text("Hello world"),
              ),
            ),
            Container(
              height: 20,
            ),

            //Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，
            //所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
            //由于第一个Text应用变换(放大)后，其在绘制时会放大，但其占用的空间依然为红色部分，
            //所以第二个Text会紧挨着红色部分，最终就会出现文字重合。
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Text("Hello world"),
                  ),
                ),
                Text(
                  "你好",
                  style: TextStyle(color: Colors.green, fontSize: 18.0),
                )
              ],
            ),
            Container(
              height: 20,
            ),

            //RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：
            //RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
            //由于RotatedBox是作用于layout阶段，所以子组件会旋转90度（而不只是绘制的内容），
            //decoration会作用到子组件所占用的实际空间上，
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //将Transform.rotate换成RotatedBox
                  child: RotatedBox(
                    quarterTurns: 1, //旋转90度(1/4圈)
                    child: Text("Hello world"),
                  ),
                ),
                Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
