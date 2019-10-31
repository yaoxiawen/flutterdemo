import 'package:flutter/material.dart';

import 'TabBarPageFirst.dart';
import 'TabBarPageSecond.dart';
import 'TabBarWidget.dart';

class TabBarBottomPageWidget extends StatefulWidget {
  @override
  _TabBarBottomPageState createState() {
    return _TabBarBottomPageState();
  }
}

class _TabBarBottomPageState extends State<TabBarBottomPageWidget> {
  final PageController _pageController = PageController();
  final List<String> tab = ["bottom1", "bottom2", "bottom3"];

  //底部Tab
  _getTab() {
    List<Widget> list = List();
    for (int i = 0; i < tab.length; i++) {
      list.add(FlatButton(
        onPressed: () {
          //每一个TabBar点击时，通过jumpTo跳转页面
          //每个页面需要跳转坐标为：当前屏幕大小*索引i
          _pageController.jumpTo(MediaQuery.of(context).size.width * i);
        },
        child: Text(
          tab[i],
          maxLines: 1,
          style: TextStyle(color: Colors.greenAccent, fontSize: 14),
        ),
      ));
    }
    return list;
  }

  _getPage(){
    return [
      TabBarPageFirst(),
      TabBarPageSecond(),
      TabBarPageFirst()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      type: TabBarWidget.BOTTOM_TAB,
      tabItems: _getTab(),
      tabViews: _getPage(),
      backgroundColor: Colors.grey,
      indicatorColor: Colors.white,
      title: Text("YXW"),
      pageControl: _pageController,
    );
  }
}
