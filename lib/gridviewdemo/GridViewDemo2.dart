import 'package:flutter/material.dart';

//横轴子元素为固定最大长度,SliverGridDelegateWithMaxCrossAxisExtent
class GridViewDemo2 extends StatelessWidget {
  final String title;

  GridViewDemo2({Key key, this.title}) : super(key: key);

  Widget _getGridView1() {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100.0,
          childAspectRatio: 2.0 //宽高比为2
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }

  /**
   * GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，
   * 可以快速的创建纵轴子元素为固定最大长度的的GridView
   */
  Widget _getGridView2() {
    return GridView.extent(
      maxCrossAxisExtent: 100.0,
      childAspectRatio: 2.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _getGridView2(),
    );
  }
}
