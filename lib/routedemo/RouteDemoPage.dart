import 'package:flutter/material.dart';

import 'PopDemoPage.dart';
import 'PushDemoPage.dart';

//Navigator是一个路由管理的组件，它提供了打开和退出路由页方法。
//Navigator通过一个栈来管理活动路由集合。通常当前屏幕显示的页面就是栈顶的路由。
class RouteDemoPage extends StatefulWidget {
  @override
  RouteDemoState createState() {
    return RouteDemoState();
  }
}

class RouteDemoState extends State<RouteDemoPage> {
  var text = "得到pop回来的数据：";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("YXW Route Demo"),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  //Future push(BuildContext context, Route route)
                  //将给定的路由入栈（即打开新的页面），返回值是一个Future对象，用以接收新路由出栈（即关闭）时的返回数据。
                  //往新的页面传值，通过push方法，和新页面的构造函数中的参数传值
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PushDemoPage(
                                title: "push传过来的值",
                              )));
                },
                child: Text("Navigator.push"),
              ),
              RaisedButton(
                onPressed: () async {
                  //bool pop(BuildContext context, [ result ])
                  //将栈顶路由出栈，result为页面关闭时返回给上一个页面的数据。
                  var result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PopDemoPage()));
                  setState(() {
                    text = "得到pop回来的数据：$result";
                  });
                },
                child: Text(text),
              ),
              RaisedButton(
                onPressed: () {
                  //命名路由在MaterialApp中，在整个应用中注册路由表routes，使用pushNamed，参数用路由名称
                  //arguments传值
                  Navigator.pushNamed(context, "pushnameddemo",
                      arguments: "pushnamed1传过来的值");
                },
                child: Text("命名路由1"),
              ),
              RaisedButton(
                onPressed: () {
                  //命名路由在MaterialApp中，在整个应用中注册路由表routes，使用pushNamed，参数用路由名称
                  //arguments传值
                  Navigator.pushNamed(context, "pushnameddemo2",
                      arguments: "pushnamed2传过来的值");
                },
                child: Text("命名路由2"),
              ),
            ],
          )
        )
    );
  }
}
