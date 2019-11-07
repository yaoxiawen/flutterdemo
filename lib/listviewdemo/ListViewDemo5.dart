import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewDemo5 extends StatefulWidget {
  final String title;

  ListViewDemo5({Key key, this.title}) : super(key: key);

  @override
  ListViewState createState() {
    return ListViewState();
  }
}

class ListViewState extends State<ListViewDemo5> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(10).map((e) => e.asPascalCase).toList());
      setState(() {
        //因为设定了itemCount，所以每次都要重新setState一下
        //ListView.separated里itemCount必须要有
        //重新构建列表
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          //添加固定列表头
          ListTile(
            title: Text("商品列表"),
          ),
          //使用Expanded自动拉伸ListView以填充屏幕剩余空间
          Expanded(
            child: ListView.separated(
              itemCount: _words.length,
              //列表项构造器
              itemBuilder: (BuildContext context, int index) {
                //如果到了表尾
                if (_words[index] == loadingTag) {
                  //不足50条，继续获取数据
                  if (_words.length - 1 < 50) {
                    //获取数据
                    _retrieveData();
                    //加载时显示loading
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0)),
                    );
                  } else {
                    //已经加载了50条数据，不再获取数据。
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "没有更多了",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                }
                //显示单词列表项
                return ListTile(title: Text(_words[index]));
              },
              //分割器构造器
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}
