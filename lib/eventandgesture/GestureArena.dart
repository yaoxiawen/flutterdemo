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

  double _left3 = 10.0; //距左边的偏移

  double _left4 = 10.0; //距左边的偏移

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
            height: 120,
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
            height: 120,
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
          //由于手势竞争最终只有一个胜出者，所以，当有多个手势识别器时，可能会产生冲突。
          //假设有一个widget，它可以左右拖动，现在我们也想检测在它上面手指按下和抬起的事件。
          Container(
            width: 300,
            height: 120,
            color: Colors.lightBlue,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  left: _left3,
                  child: GestureDetector(
                    child: CircleAvatar(child: Text("A")), //要拖动和点击的widget
                    onHorizontalDragUpdate: (DragUpdateDetails details) {
                      setState(() {
                        _left3 += details.delta.dx;
                      });
                    },
                    onHorizontalDragEnd: (details){
                      //nHorizontalDragEnd 和 onTapUp发生了冲突，
                      //但是因为是在拖动的语义中，所以onHorizontalDragEnd胜出，所以就会打印 “onHorizontalDragEnd”。
                      print("onHorizontalDragEnd");
                    },
                    onTapDown: (details){
                      //在拖动时，刚开始按下手指时在没有移动时，拖动手势还没有完整的语义，
                      //此时TapDown手势胜出(win)，此时打印"down
                      print("down");
                    },
                    onTapUp: (details){
                      print("up");
                    },
                  ),
                )
              ],
            ),
          ),
          //比如在一个轮播图组件中，我们希望手指按下时，暂停轮播，
          //而抬起时恢复轮播，但是由于轮播图组件中本身可能已经处理了拖动手势（支持手动滑动切换），甚至可能也支持了缩放手势，
          //这时我们如果在外部再用onTapDown、onTapUp来监听的话是不行的。这时通过Listener监听原始指针事件就行。

          //手势冲突只是手势级别的，而手势是对原始指针的语义化的识别，
          //所以在遇到复杂的冲突场景时，都可以通过Listener直接识别原始指针事件来解决冲突。
          Container(
            width: 300,
            height: 120,
            color: Colors.yellowAccent,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  left: _left4,
                  child:
                  Listener(
                    onPointerDown: (details) {
                      print("down");
                    },
                    onPointerUp: (details) {
                      print("up");
                    },
                    child: GestureDetector(
                      child: CircleAvatar(child: Text("A")), //要拖动和点击的widget
                      onHorizontalDragUpdate: (DragUpdateDetails details) {
                        setState(() {
                          _left4 += details.delta.dx;
                        });
                      },
                      onHorizontalDragEnd: (details){
                        print("onHorizontalDragEnd");
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
