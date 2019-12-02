import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，
//而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势，
//GestureDetector直接可以接收一个子widget。
//GestureRecognizer是一个抽象类，一种手势的识别器对应一个GestureRecognizer的子类，
//Flutter实现了丰富的手势识别器，我们可以直接使用。
class GestureDemo extends StatefulWidget {

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

  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW GestureDemo"),
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
                    //由于外层SingleChildScrollView，导致竖直方向的滑动会有点问题，被外层给抢夺了
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
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: "first"),
                TextSpan(
                    text: "second",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: _toggle ? Colors.blue : Colors.red),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      }),
                TextSpan(text: "first"),
              ]),
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
                    //由于外层SingleChildScrollView，导致竖直方向的滑动会有点问题，被外层给抢夺了
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
          ],
        ),
      ),
    );
  }
}
