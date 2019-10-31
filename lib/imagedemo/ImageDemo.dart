import 'package:flutter/material.dart';

//ImageProvider 是一个抽象类，主要定义了图片数据获取的接口load()，
//从不同的数据源获取图片需要实现不同的ImageProvider，
//如AssetImage是实现了从Asset中加载图片的ImageProvider，而NetworkImage实现了从网络加载图片的ImageProvider。
class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Image Demo"),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //从asset中加载图片
            ],
          )),
    );
  }
}
