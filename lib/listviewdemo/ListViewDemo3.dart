import 'package:flutter/material.dart';

//ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子组件真正显示的时候才会被创建，
// 也就说通过该构造函数创建的ListView是支持基于Sliver的懒加载模型的。
//itemCount：列表项的数量，如果为null，则为无限列表。
class ListViewDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("YXW ListView Demo3"),
      ),
      body: ListView.builder(itemBuilder: null),
    );
  }
}
