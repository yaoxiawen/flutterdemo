import 'package:flutter/material.dart';

//尺寸限制类容器
class ConstrainedBoxDemo extends StatelessWidget {
  final Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Constrained Demo"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              //虽然将Container的高度设置为5像素，
              //但是最终却是50像素，这正是ConstrainedBox的最小高度限制生效了。
              constraints: BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0, //最小高度为50像素
              ),
              child: Container(
                height: 5.0,
                child: redBox,
              ),
            ),
            Container(
              height: 10,
            ),

            //SizedBox只是ConstrainedBox的一个定制
            //等价于BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
            SizedBox(
              height: 50,
              width: 50,
              child: redBox,
            ),
            Container(
              height: 10,
            ),

            //有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。
            //实际上，只有这样才能保证父限制与子限制不冲突。
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                child: redBox,
              ),
            ),
            Container(
              height: 10,
            ),

            //UnconstrainedBox不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制。
            //一般情况下，很少直接使用此组件，但在"去除"多重限制的时候也许会有帮助。
            //UnconstrainedBox对父组件限制的“去除”并非是真正的去除：
            //例子中虽然红色区域大小是90×20，但上方仍然有80的空白空间。
            //也就是说父限制的minHeight(100.0)仍然是生效的，只不过它不影响最终子元素redBox的大小，
            //但仍然还是占有相应的空间，可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，
            //而redBox只受子ConstrainedBox限制，
            ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),
                //父
                child: UnconstrainedBox(
                  //“去除”父级限制
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                    child: redBox,
                  ),
                )),
            Container(
              height: 10,
            ),

            AppBar(
              actions: <Widget>[
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(Colors.white70),
                  ),
                )
              ],
            ),

            //因为AppBar中已经指定了actions按钮的限制条件,
            //所以我们要自定义loading按钮大小，
            //就必须通过UnconstrainedBox来“去除”父元素的限制
            AppBar(
              actions: <Widget>[
                UnconstrainedBox(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
