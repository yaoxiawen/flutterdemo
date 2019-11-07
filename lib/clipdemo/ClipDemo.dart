import 'package:flutter/material.dart';

//ClipOval	子组件为正方形时剪裁为内贴圆形，为矩形时，剪裁为内贴椭圆
//ClipRRect	将子组件剪裁为圆角矩形
//ClipRect	剪裁子组件到实际占用的矩形大小（溢出部分剪裁）
class ClipDemo extends StatelessWidget {
  final Widget img = Image.asset("images/timg.jpeg",width: 120,);

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
              ClipRRect( //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: img,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,//宽度设为原来宽度一半，另一半会溢出
                    child: img,
                  ),
                  Text("你好世界", style: TextStyle(color: Colors.green),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRect(//将溢出部分剪裁
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5,//宽度设为原来宽度一半
                      child: img,
                    ),
                  ),
                  Text("你好世界",style: TextStyle(color: Colors.green))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
