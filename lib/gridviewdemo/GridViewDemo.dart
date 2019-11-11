import 'package:flutter/material.dart';

//横轴固定数量,SliverGridDelegateWithFixedCrossAxisCount
class GridViewDemo extends StatelessWidget {
  final String title;

  GridViewDemo({Key key, this.title}) : super(key: key);

  Widget _getGridView1() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //横轴三个子widget
          childAspectRatio: 1.0 //宽高比为1时，子widget
          ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast)
      ],
    );
  }

  /**
   * GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
   * 可以快速的创建横轴固定数量子元素的GridView
   */
  Widget _getGridView2() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
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
