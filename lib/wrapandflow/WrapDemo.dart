import 'package:flutter/material.dart';

//流式布局
//超出屏幕显示范围会自动折行的布局
//Wrap和Flow

//可以认为Wrap和Flex（包括Row和Column）除了超出显示范围后Wrap会折行外，其它行为基本相同。
//一般很少会使用Flow，因为其过于复杂，需要自己实现子widget的位置转换，
//在很多场景下首先要考虑的是Wrap是否满足需求。
//Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景。
class WrapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Wrap Demo"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //因为Row默认只有一行，如果超出屏幕不会折行
            Row(
              children: <Widget>[
                Text("*" * 100),
              ],
            ),
            //wrap的许多属性在row中也有
            Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                Text("*" * 100),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 8.0, // 主轴(水平)方向间距
              runSpacing: 4.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('A')),
                  label: Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('M')),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('H')),
                  label: Text('Mulligan'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text('Laurens'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
