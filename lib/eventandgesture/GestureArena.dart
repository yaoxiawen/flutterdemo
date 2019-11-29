import 'package:flutter/material.dart';

class GestureArena extends StatefulWidget {
  final String title;

  GestureArena({Key key, this.title}) : super(key: key);

  @override
  _GestureArenaState createState() {
    return _GestureArenaState();
  }
}

class _GestureArenaState extends State<GestureArena> {
  double _top1 = 10.0; //距顶部的偏移
  double _left1 = 10.0; //距左边的偏移

  double _top2 = 10.0; //距顶部的偏移
  double _left2 = 10.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 300,
            height: 200,
            color: Colors.red,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: _top1,
                  left: _left1,
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
                        _left1 += e.delta.dx;
                        _top1 += e.delta.dy;
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
          //手势竞争
          //以拖动手势为例，同时识别水平和垂直方向的拖动手势，当用户按下手指时就会触发竞争（水平方向和垂直方向），
          //一旦某个方向“获胜”，则直到当次拖动手势结束都会沿着该方向移动。
          //每次拖动只会沿一个方向移动（水平或垂直），而竞争发生在手指按下后首次移动（move）时，
          // 此例中具体的“获胜”条件是：首次移动时的位移在水平和垂直方向上的分量大的一个获胜。
          Container(
            width: 300,
            height: 200,
            color: Colors.greenAccent,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: _top2,
                  left: _left2,
                  child: GestureDetector(
                    child: CircleAvatar(child: Text("A")),
                    //垂直方向拖动事件
                    onVerticalDragUpdate: (DragUpdateDetails details) {
                      setState(() {
                        _top2 += details.delta.dy;
                      });
                    },
                    //水平方向拖动事件
                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                      setState(() {
                        _left2 += details.delta.dx;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          //手势冲突
          Container(
            width: 300,
            height: 150,
            color: Colors.lightBlue,
          )
        ],
      ),
    );
  }
}
