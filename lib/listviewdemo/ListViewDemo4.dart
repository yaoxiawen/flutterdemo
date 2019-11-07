import 'package:flutter/material.dart';

//ListView.separated可以在生成的列表项之间添加一个分割组件，它比ListView.builder多了一个separatorBuilder参数，
//该参数是一个分割组件生成器。
class ListViewDemo4 extends StatelessWidget {
  final String title;

  ListViewDemo4({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(
      color: Colors.green,
    );
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(title),
      ),
      body: ListView.separated(
        itemCount: 20,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
      ),
    );
  }
}
