import 'package:flutter/material.dart';

class FutureBuilderDemo extends StatelessWidget {
  final String title;

  FutureBuilderDemo({Key key, this.title}) : super(key: key);

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "mockNetworkData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (context, snapshot) {
            //请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                //请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              }else{
                //请求成功，显示数据
                return Text("Content: ${snapshot.data}");
              }
            }else{
              //请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
