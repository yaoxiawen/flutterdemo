import 'package:flutter/material.dart';

//ScrollController常用的属性和方法：
//offset：可滚动组件当前的滚动位置。
//jumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，
// 它们不同之处在于，后者在跳转时会执行一个动画，而前者不会。
class ScrollControllerDemo extends StatefulWidget {
  final String title;

  ScrollControllerDemo({Key key, this.title}) : super(key: key);

  @override
  ScrollControllerState createState() {
    return ScrollControllerState();
  }
}

class ScrollControllerState extends State<ScrollControllerDemo> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    //监听滚动事件
    _controller.addListener(() {
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        // 显示进度条
        child: ListView.separated(
          itemCount: 100,
          //itemExtent: 50, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
          controller: _controller,
          itemBuilder: (context, index) => ListTile(
            title: Text("$index"),
          ),
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              }),
    );
  }
}
