import 'package:flutter/material.dart';

//所有Material 库中的按钮都有如下相同点：
//1、按下时都会有“水波动画”（又称“涟漪动画”，就是点击时按钮上会出现水波荡漾的动画）。
//2、有一个onPressed属性来设置点击回调，当按钮按下时会执行该回调，
// 如果不提供该回调则按钮会处于禁用状态，禁用状态不响应用户点击。
class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Button Demo"),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                child: Text("RaisedButton"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("FlatButton"),
                onPressed: () {},
              ),
              OutlineButton(
                child: Text("OutlineButton"),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              //RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，
              //通过它可以轻松创建带图标的按钮
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: () {},
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: () {},
              ),
              FlatButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情"),
                onPressed: () {},
              ),
              //自定义按钮
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
              RaisedButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
                //RaisedButton默认有配置阴影：
                //正常状态下的阴影
                elevation: 2.0,
                //按下时的阴影
                highlightElevation: 8.0,
                //禁用时的阴影
                disabledElevation: 0.0,
              )
            ],
          )),
    );
  }
}
