import 'package:flutter/material.dart';

/**
 * 在Dart中Stream 也是用于接收异步事件数据，和Future 不同的是，它可以接收多个异步操作的结果，
 * 它常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。
 * StreamBuilder正是用于配合Stream来展示流上事件（数据）变化的UI组件
 */
class StreamBuilderDemo extends StatelessWidget {
  final String title;

  StreamBuilderDemo({Key key, this.title}) : super(key: key);

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter(),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }
            return null; // unreachable
          },
        ),
      ),
    );
  }
}
