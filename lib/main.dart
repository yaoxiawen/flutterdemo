//导入了Material UI组件库。Material是一种标准的移动端和web端的视觉设计语言，
//Flutter默认提供了一套丰富的Material风格的UI组件。
import 'package:flutter/material.dart';
import 'package:flutter_app/progressdemo/ProgressDemoPage.dart';

import 'aligndemo/AlignDemo.dart';
import 'asynuiupdate/AsynUIUpdateDemoPage.dart';
import 'buttondemo/ButtonDemo.dart';
import 'canvasdemo/CanvasDemo.dart';
import 'clipdemo/ClipDemo.dart';
import 'constrainedboxdemo/ConstrainedBoxDemo.dart';
import 'containerdemo/ContainerDemo.dart';
import 'customscrollview/CustomScrollViewDemo.dart';
import 'decoratedboxdemo/DecoratedBoxDemo.dart';
import 'dialogdemo/DialogDemo.dart';
import 'eventandgesture/EventAndGestureDemoPage.dart';
import 'flexdemo/FlexDemo.dart';
import 'gridviewdemo/GridViewDemo.dart';
import 'gridviewdemo/GridViewDemoPage.dart';
import 'icondemo/IconDemo.dart';
import 'imagedemo/ImageDemo.dart';
import 'inheritedwidget/InheritedWidgetDemo.dart';
import 'lifedemo/LifeDemo.dart';
import 'listviewdemo/ListViewDemo.dart';
import 'listviewdemo/ListViewDemo2.dart';
import 'listviewdemo/ListViewDemoPage.dart';
import 'officialdemo/OfficialDemoPage.dart';
import 'paddingdemo/PaddingDemo.dart';
import 'providerdemo/ProviderDemo.dart';
import 'routedemo/PushNamedDemoPage.dart';
import 'routedemo/RouteDemoPage.dart';
import 'rowandcolumn/RowDemo.dart';
import 'scaffolddemo/ScaffoldDemo.dart';
import 'scrolldemo/ScrollDemoPage.dart';
import 'sharedpreferencesdemo/SharedPreferencesDemo.dart';
import 'singlechildscrollviewdemo/SingleChildScrollViewDemo.dart';
import 'stackdemo/StackDemo.dart';
import 'statemanager/StateManagerDemo.dart';
import 'switchandcheckboxdemo/SwitchAndCheckboxDemo.dart';
import 'tabbardemo/TabBarDemoPage.dart';
import 'textdemo/TextDemo.dart';
import 'textfielddemo/TextFieldDemo.dart';
import 'themedemo/ThemeDemo.dart';
import 'transformdemo/TransformDemo.dart';
import 'willpopscope/WillPopScopeDemo.dart';
import 'wrapandflow/FlowDemo.dart';
import 'wrapandflow/WrapDemo.dart';

//应用入口
void main() => runApp(MyApp()); //main函数使用了(=>)符号，这是Dart中单行函数或方法的简写。

//Flutter 应用中main函数为应用程序的入口。
//main函数中调用了runApp 方法，它的功能是启动Flutter应用。
//runApp它接受一个Widget参数，在本示例中它是一个MyApp对象，MyApp()是Flutter应用的根组件。
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MaterialApp 是Material库中提供的Flutter APP框架，
    //通过它可以设置应用的名称、主题、语言、首页及路由列表等。MaterialApp也是一个widget。
    return MaterialApp(
      //应用名称
      title: 'YXW flutter app',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //蓝色主题
        primarySwatch: Colors.blue,
      ),
      //应用首页路由
      //home 为Flutter应用的首页，它也是一个widget。
      home: HomePage(),
      routes: routes,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> routeLists = routes.keys.toList();

  @override
  Widget build(BuildContext context) {
    //Scaffold 是Material库中提供的页面脚手架，它包含导航栏和Body以及FloatingActionButton（如果需要的话）。
    //本书后面示例中，路由默认都是通过Scaffold创建。
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Home Page"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, routeLists[index]);
              },
              child: Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Text(routeLists[index]),
                ),
              ),
            );
          },
          itemCount: routes.length - 2,
        ),
      ),
    );
  }
}

Map<String, WidgetBuilder> routes = {
  "官方Demo": (context) {
    return OfficialDemoPage(title: "Official Demo");
  },
  "TabBarDemo": (context) {
    return TabBarDemoPage();
  },
  "RouteDemo": (context) {
    return RouteDemoPage();
  },
  "StateManagerDemo": (context) {
    return StateManagerDemo();
  },
  "TextDemo": (context) {
    return TextDemo();
  },
  "ButtonDemo": (context) {
    return ButtonDemo();
  },
  "CanvasDemo": (context) {
    return CanvasDemo();
  },
  "LifeDemo": (context) {
    return LifeDemo();
  },
  "TextFieldDemo": (context) {
    return TextFieldDemo();
  },
  "SharedPreferencesDemo": (context) {
    return SharedPreferencesDemo();
  },
  "ImageDemo": (context) {
    return ImageDemo();
  },
  "IconDemo": (context) {
    return IconDemo();
  },
  "SwitchAndCheckboxDemo": (context) {
    return SwitchAndCheckboxDemo();
  },
  "ProgressDemo": (context) {
    return ProgressDemoPage();
  },
  "RowDemo": (context) {
    return RowDemo();
  },
  "FlexDemo": (context) {
    return FlexDemo();
  },
  "WrapDemo": (context) {
    return WrapDemo();
  },
  "FlowDemo": (context) {
    return FlowDemo();
  },
  "StackDemo": (context) {
    return StackDemo();
  },
  "AlignDemo": (context) {
    return AlignDemo();
  },
  "PaddingDemo": (context) {
    return PaddingDemo();
  },
  "ConstrainedBoxDemo": (context) {
    return ConstrainedBoxDemo();
  },
  "DecoratedBoxDemo": (context) {
    return DecoratedBoxDemo();
  },
  "TransformDemo": (context) {
    return TransformDemo();
  },
  "ContainerDemo": (context) {
    return ContainerDemo();
  },
  "ScaffoldDemo": (context) {
    return ScaffoldDemo();
  },
  "ClipDemo": (context) {
    return ClipDemo();
  },
  "SingleChildScrollViewDemo": (context) {
    return SingleChildScrollViewDemo();
  },
  "ListViewDemo": (context) {
    return ListViewDemoPage();
  },
  "GridViewDemo": (context) {
    return GridViewDemoPage();
  },
  "CustomScrollViewDemo": (context) {
    return CustomScrollViewDemo();
  },
  "ScrollDemo": (context) {
    return ScrollDemoPage();
  },
  "WillPopScopeDemo": (context) {
    return WillPopScopeDemo();
  },
  "InheritedWidgetDemo": (context) {
    return InheritedWidgetDemo();
  },
  "ProviderDemo": (context) {
    return ProviderDemo();
  },
  "ThemeDemo": (context) {
    return ThemeDemo();
  },
  "AsynUIUpdateDemo": (context) {
    return AsynUIUpdateDemoPage();
  },
  "DialogDemo": (context) {
    return DialogDemo();
  },
  "EventAndGestureDemo": (context) {
    return EventAndGestureDemoPage();
  },
  "PushNamedDemo": (context) {
    return PushNamedDemoPage();
  },
  "PushNamedDemo2": (context) {
    return PushNamedDemoPage(
      title: ModalRoute.of(context).settings.arguments,
    );
  }
};
