import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Row Demo"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12),
        child: Column(
          //测试Row对齐方式，排除Column默认居中对齐的干扰，children全部左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              //水平方向居中显示
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              //由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，
              //所以对齐是无意义的，所以会从左往右显示
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              //textDirection值为TextDirection.rtl，所以子组件会从右向左的顺序排列，
              //而此时MainAxisAlignment.end表示左对齐，
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            Row(
              //verticalDirection值为VerticalDirection.up，即从低向顶排列，
              //而此时crossAxisAlignment值为CrossAxisAlignment.start表示底对齐。
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(
                  " hello world ",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(" I am Jack "),
              ],
            ),
            //如果Row里面嵌套Row，或者Column里面再嵌套Column，
            //那么只有对最外面的Row或Column会占用尽可能大的空间，
            //里面Row或Column所占用的空间为实际大小，
            Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max, //无效，占用的空间为实际大小
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisSize: MainAxisSize.max, //无效，占用的空间为实际大小
                        children: <Widget>[
                          Text("hello world "),
                          Text("I am Jack "),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
