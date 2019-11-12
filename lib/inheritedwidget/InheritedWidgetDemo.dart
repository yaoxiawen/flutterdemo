import 'package:flutter/material.dart';

//InheritedWidget是Flutter中非常重要的一个功能型组件，提供了一种数据在widget树中从上到下传递、共享的方式，
// 比如在应用的根widget中通过InheritedWidget共享了一个数据，那么便可以在任意子widget中来获取该共享的数据！

//调用inheritFromWidgetOfExactType()和ancestorInheritedElementForWidgetOfExactType()的区别就是前者会注册依赖关系，
//而后者不会，所以在调用inheritFromWidgetOfExactType()时，InheritedWidget和依赖它的子孙组件关系便完成了注册，
// 之后当InheritedWidget发生变化时，就会更新依赖它的子孙组件，也就是会调这些子孙组件的didChangeDependencies()方法和build()方法。
//而当调用的是ancestorInheritedElementForWidgetOfExactType()时，由于没有注册依赖关系，
//所以之后当InheritedWidget发生变化时，就不会更新相应的子孙Widget。
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
    //只想在__TestWidgetState中引用ShareDataWidget数据，
    //但却不希望在ShareDataWidget发生变化时调用__TestWidgetState的didChangeDependencies()方法
//    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

//实现一个子组件_TestWidget，在其build方法中引用ShareDataWidget中的数据。
//同时，在其didChangeDependencies() 回调中打印日志
class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  /**
   * 一般来说，子widget很少会重写此方法，因为在依赖改变后framework也都会调用build()方法。
   * 但是，如果你需要在依赖改变后执行一些昂贵的操作，比如网络请求，
   * 这时最好的方式就是在此方法中执行，这样可以避免每次build()都执行这些昂贵操作。
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

class InheritedWidgetDemo extends StatefulWidget {
  @override
  _InheritedWidgetDemoState createState() => new _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget Demo"),
      ),
      body: Center(
        child: ShareDataWidget(
          //使用ShareDataWidget
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(), //子widget中依赖ShareDataWidget
              ),
              RaisedButton(
                child: Text("Increment"),
                //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}
