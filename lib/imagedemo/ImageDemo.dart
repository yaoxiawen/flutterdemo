import 'package:flutter/material.dart';

//ImageProvider 是一个抽象类，主要定义了图片数据获取的接口load()，
//从不同的数据源获取图片需要实现不同的ImageProvider，
//如AssetImage是实现了从Asset中加载图片的ImageProvider，而NetworkImage实现了从网络加载图片的ImageProvider。
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/timg.jpeg");
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Image Demo"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 10,
              ),

              //从asset中加载图片
              Image(
                image: AssetImage("images/timg.jpeg"),
                width: 100,
              ),
              Container(
                height: 10,
              ),

              //Image也提供了一个快捷的构造函数Image.asset用于从asset中加载、显示图片:
              Image.asset(
                "images/timg.jpeg",
                width: 100.0,
              ),
              Container(
                height: 10,
              ),

              //从网络加载图片
              Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),
              Container(
                height: 10,
              ),

              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
              ),
              Container(
                height: 10,
              ),

              //fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Container(
                height: 10,
              ),

              //contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
              Image(
                image: img,
                height: 50,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              Container(
                height: 10,
              ),

              //cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Container(
                height: 10,
              ),

              //fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
              Container(
                height: 10,
              ),

              //fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitHeight,
              ),
              Container(
                height: 10,
              ),

              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.scaleDown,
              ),
              Container(
                height: 10,
              ),

              //none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.none,
              ),
              Container(
                height: 10,
              ),

              //color和 colorBlendMode：在图片绘制时可以对每一个像素进行颜色混合处理，color指定混合色，而colorBlendMode指定混合模式，
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Container(
                height: 10,
              ),

              //repeat：当图片本身大小小于显示空间时，指定图片的重复规则。
              Image(
                image: img,
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              )
            ],
          ),
        ),
      ),
    );
  }
}
