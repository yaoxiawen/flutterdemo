import 'package:flutter/material.dart';

//使用Listener来监听原始触摸事件
//事件会在组件树中向上冒泡，这些事件会从最内部的组件被分发到组件树根的路径上的所有组件，这和Web开发中浏览器的事件冒泡机制相似，
class EventDemo extends StatefulWidget {
  final String title;

  EventDemo({Key key, this.title}) : super(key: key);

  @override
  _EventDemoState createState() {
    return _EventDemoState();
  }
}

class _EventDemoState extends State<EventDemo> {
  //定义一个状态，保存当前指针位置
  PointerEvent _event1;
  PointerEvent _event2;

  _changeEvent1(PointerEvent event) {
    setState(() {
      _event1 = event;
    });
  }

  _changeEvent2(PointerEvent event) {
    setState(() {
      _event2 = event;
    });
  }

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
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                width: 350.0,
                height: 200.0,
                child: Text(
                  _event1?.toString() ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPointerDown: (PointerDownEvent event) => _changeEvent1(event),
              onPointerMove: (PointerMoveEvent event) => _changeEvent1(event),
              onPointerUp: (PointerUpEvent event) => _changeEvent1(event),
            ),
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                width: 350.0,
                height: 200.0,
                child: Text(
                  _event2?.toString() ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPointerDown: (PointerDownEvent event) => _changeEvent2(event),
              onPointerMove: (PointerMoveEvent event) => _changeEvent2(event),
              onPointerUp: (PointerUpEvent event) => _changeEvent2(event),
              //默认情况deferToChild
              //子组件会一个接一个的进行命中测试，如果子组件中有测试通过的，则当前组件通过，
              //这就意味着，如果指针事件作用于子组件上时，其父级组件也肯定可以收到该事件。
              behavior: HitTestBehavior.deferToChild,
            ),
            Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(child: Text("Box A")),
              ),
              //opaque：在命中测试时，将当前组件当成不透明处理(即使本身是透明的)，
              //最终的效果相当于当前Widget的整个区域都是点击区域。
              //该属性并不能用于在组件树中拦截（忽略）事件，它只是决定命中测试时的组件大小。
              //默认情况deferToChild,最内部子组件Text通过命中测试。
              behavior: HitTestBehavior.opaque,
              onPointerDown: (event) => print("down A"),
            ),
            //translucent：当点击组件透明区域时，可以对自身边界内及底部可视区域都进行命中测试，
            //这意味着点击顶部组件透明区域时，顶部组件和底部组件都可以接收到事件
            Stack(
              children: <Widget>[
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                    child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.blue)),
                  ),
                  onPointerDown: (event) => print("down0"),
                ),
                Listener(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                    child: Center(child: Text("左上角200*100范围内非文本区域(即透明区域)点击")),
                  ),
                  onPointerDown: (event) => print("down1"),
                  behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
                )
              ],
            ),
            //不想让某个子树响应PointerEvent的话，我们可以使用IgnorePointer和AbsorbPointer，
            //这两个组件都能阻止子树接收指针事件，
            //不同之处在于AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与，
            //这就意味着AbsorbPointer本身是可以接收指针事件的(但其子树不行)，而IgnorePointer不可以。
            Listener(
              child: AbsorbPointer(
                //点击Container时，由于它在AbsorbPointer的子树上，所以不会响应指针事件，所以日志不会输出"in"，
                //但AbsorbPointer本身是可以接收指针事件的，所以会输出"up"。
                //如果将AbsorbPointer换成IgnorePointer，那么两个都不会输出。
                child: Listener(
                  child: Container(
                    color: Colors.red,
                    width: 200.0,
                    height: 100.0,
                  ),
                  onPointerDown: (event)=>print("in"),
                ),
              ),
              onPointerDown: (event)=>print("up"),
            )
          ],
        ),
      ),
    );
  }
}
