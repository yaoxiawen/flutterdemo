import 'package:flutter/material.dart';

class TabBarPageFirst extends StatefulWidget {
  @override
  _TabBarPageFirstState createState() {
    return _TabBarPageFirstState();
  }
}

//页面点击切换时，StatefulWidget的子页面每次都会重新调用initstate。
//需要AutomaticKeepAliveClientMixin，每个tab对应的StatefulWidget的state，
// 需要通过with AutomaticKeepAliveClientMixin，然后重写bool get wantKeepAlive => true;
// ，就可以实现不重新构建的效果了。
class _TabBarPageFirstState extends State<TabBarPageFirst>
    with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];

  Widget _getRow(String pair) {
    //ListTile 通常用于在 Flutter 中填充 ListView。
    return ListTile(
      title: Text(
        pair,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  List<String> generateSuggestions(){
    return [
      "111",
      "222",
      "333"
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);// See AutomaticKeepAliveClientMixin.
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context,index){
        if(index.isOdd){
          return Divider();
        }else{
          //如果到达列表最后了，列表增加，因此不设定itemCount字段
          // ~/，取整除法，就是两个int相除
          final i = index~/2;
          if(i>=_suggestions.length){
            _suggestions.addAll(generateSuggestions());
          }
          return _getRow(_suggestions[i]);
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
