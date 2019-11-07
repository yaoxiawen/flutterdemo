import 'package:flutter/material.dart';

//ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子组件真正显示的时候才会被创建，
// 也就说通过该构造函数创建的ListView是支持基于Sliver的懒加载模型的。
//itemCount：列表项的数量，如果为null，则为无限列表。
class ListViewDemo3 extends StatelessWidget {
  final String title;

  ListViewDemo3({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: 20,
          //该参数如果不为null，则会强制children的“长度”为itemExtent的值
          itemExtent: 50.0, //强制高度为50.0
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          }),
    );
  }
}
