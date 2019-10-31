import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Text Demo"),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //textAlign：文本的对齐方式；可以选择左对齐、右对齐还是居中。
              //注意，对齐的参考系是Text widget本身。
              //本例中虽然是指定了居中对齐，但因为Text文本内容宽度不足一行，Text的宽度和文本内容长度相等，那么这时指定对齐方式是没有意义的，
              //只有Text宽度大于文本内容长度时指定此属性才有意义。
              Text(
                "hello world " * 6,
                textAlign: TextAlign.center,
              ),
              Text(
                "hello world " * 5,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "hello world",
                textScaleFactor: 1.5,
              ),
              Text(
                "Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: Paint()..color = Colors.yellow,
                    //等价于backgroundColor: Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(color: Colors.blue),
                    recognizer: null),
              ])),
              //在Widget树中，文本的样式默认是可以被继承的
              //（子类文本类组件未指定具体样式时可以使用Widget树中父级设置的默认样式），
              //因此，如果在Widget树的某一个节点处设置一个默认的文本样
              DefaultTextStyle(
                //1.设置文本默认样式
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
