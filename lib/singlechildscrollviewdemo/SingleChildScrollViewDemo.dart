import 'package:flutter/material.dart';

//需要注意的是，通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，
//这是因为SingleChildScrollView不支持基于Sliver的延迟实例化模型，
//所以如果预计视口可能包含超出屏幕尺寸太多的内容时，
//那么使用SingleChildScrollView将会非常昂贵（性能差），
//此时应该使用一些支持Sliver延迟加载的可滚动组件，如ListView。
class SingleChildScrollViewDemo extends StatelessWidget {
  final String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW SingleChildScrollView"),
      ),
      body: Scrollbar(
        // 显示进度条
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12),
            child: Center(
              child: Column(
                children: str
                    .split("")
                    .map(
                      (e) => Text(
                        e,
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
