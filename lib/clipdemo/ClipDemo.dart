import 'package:flutter/material.dart';

//ClipOval	子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
//ClipRRect	将子组件剪裁为圆角矩形
//ClipRect	剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
class ClipDemo extends StatelessWidget {
  final Widget img = Image.asset(
    "images/timg.jpeg",
    width: 120,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Clip Demo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              img, //不剪裁
              ClipOval(child: img), //剪裁为圆形
              ClipRRect(
                //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: img,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                    child: img,
                  ),
                  Text(
                    "你好世界",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRect(
                    //将溢出部分剪裁
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, //宽度设为原来宽度一半
                      child: img,
                    ),
                  ),
                  Text("你好世界", style: TextStyle(color: Colors.green))
                ],
              ),
              //剪裁子组件的特定区域，使用CustomClipper。
              //剪裁成功了，但是图片所占用的空间大小仍然是60×60（红色区域），
              //这是因为剪裁是在layout完成后的绘制阶段进行的，所以不会影响组件的大小，
              //这和Transform原理是相似的。
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: ClipRect(
                  clipper: MyClipper(),
                  child: img,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  /*
  shouldReclip() 接口决定是否重新剪裁。
  如果在应用中，剪裁区域始终不会发生变化时应该返回false，
  这样就不会触发重新剪裁，避免不必要的性能开销。
  如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），
  那么变化后应该返回true来重新执行剪裁。
   */
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}