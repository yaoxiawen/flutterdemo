import 'package:flutter/material.dart';

//默认构造函数有一个children参数，它接受一个Widget列表（List）。
//这种方式适合只有少量的子组件的情况，因为这种方式需要将所有children都提前创建好（这需要做大量工作），
//而不是等到子widget真正显示的时候再创建，也就是说通过默认构造函数构建的ListView没有应用基于Sliver的懒加载模型。
//实际上通过此方式创建的ListView和使用SingleChildScrollView+Column的方式没有本质的区别。

//可滚动组件通过一个List来作为其children属性时，只适用于子组件较少的情况，
//这是一个通用规律，并非ListView自己的特性，像GridView也是如此。
class ListViewDemo2 extends StatelessWidget {
  final String title;

  ListViewDemo2({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(title),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          const Text('I\'m dedicating every day to you'),
          const Text('Domestic life was never quite my style'),
          const Text('When you smile, you knock me out, I fall apart'),
          const Text('And I thought I was so smart'),
        ],
      ),
    );
  }
}
