import 'package:flutter/material.dart';
import 'GridViewDemo.dart';
import 'GridViewDemo2.dart';
import 'GridViewDemo3.dart';

class GridViewDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("YXW GridView Demo"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GridViewDemo(title: "横轴固定数量")));
                },
                child: Text("横轴固定数量"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GridViewDemo2(title: "横轴子元素为固"
                              "定最大长度")));
                },
                child: Text("横轴子元素为固定最大长度"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GridViewDemo3(title: "GridView.builder")));
                },
                child: Text("GridView.builder"),
              ),
            ],
          ),
        ),
    );
  }
}
