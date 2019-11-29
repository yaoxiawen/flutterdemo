import 'package:flutter/material.dart';

class GestureDemo extends StatefulWidget {
  final String title;

  GestureDemo({Key key, this.title}) : super(key: key);

  @override
  _GestureDemo createState() {
    return _GestureDemo();
  }
}

class _GestureDemo extends State<GestureDemo>
    with SingleTickerProviderStateMixin {
  String _operation = "No Gesture detected!"; //保存事件名

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  double _top = 10.0; //距顶部的偏移
  double _left = 10.0; //距左边的偏移

  double _width = 300.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 300.0,
                height: 200.0,
                child: Text(
                  _operation,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"), //点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            ),
            Container(
              width: 300,
              height: 200,
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: _top,
                    left: _left,
                    child: GestureDetector(
                      child: CircleAvatar(child: Text("A")),
                      //手指按下时会触发此回调
                      onPanDown: (DragDownDetails e) {
                        //打印手指按下的位置(相对于屏幕,且高度包含了标题栏的高度，没有包含状态栏)
                        print("用户手指按下：${e.globalPosition}");
                      },
                      //手指滑动时会触发此回调
                      onPanUpdate: (DragUpdateDetails e) {
                        //用户手指滑动时，更新偏移，重新构建
                        //单一方向拖动时，只需要改变top/left其一即可
                        setState(() {
                          _left += e.delta.dx;
                          _top += e.delta.dy;
                        });
                      },
                      onPanEnd: (DragEndDetails e) {
                        //打印滑动结束时在x、y轴上的速度
                        print(e.velocity);
                      },
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              //指定宽度，高度自适应
              child: Image.asset("./images/timg.jpeg", width: _width),
              onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  //缩放倍数在0.8到10倍之间
                  _width = 300 * details.scale.clamp(.8, 10.0);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
