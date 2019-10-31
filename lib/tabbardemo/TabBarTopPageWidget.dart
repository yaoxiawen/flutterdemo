import 'package:flutter/material.dart';

import 'package:flutter_app/tabbardemo/TabBarPageFirst.dart';
import 'package:flutter_app/tabbardemo/TabBarPageSecond.dart';
import 'TabBarWidget.dart';

class TabBarTopPageWidget extends StatefulWidget {
  @override
  _TabBarTopPageState createState() {
    return _TabBarTopPageState();
  }
}

class _TabBarTopPageState extends State<TabBarTopPageWidget> {
  final PageController _pageController = PageController();
  final List<String> tab = ["top1", "top2", "top3","top4"];

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
          style: TextStyle(color: Colors.lightGreenAccent, fontSize: 14),
        ),
      ));
    }
    return list;
  }

  _getPage(){
    return [
      TabBarPageFirst(),
      TabBarPageSecond(),
      TabBarPageFirst(),
      TabBarPageSecond()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      type: TabBarWidget.TOP_TAB,
      tabItems: _getTab(),
      tabViews: _getPage(),
      backgroundColor: Colors.grey,
      indicatorColor: Colors.white,
      title: Text("YXW"),
      pageControl: _pageController,
    );
  }
}
