import 'package:flutter/material.dart';

//alignment：此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件。
//所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，
//只要包含某个轴上的一个定位属性就算在该轴上有定位。
//textDirection：和Row、Wrap的textDirection功能一样，都用于确定alignment对齐的参考系，
//即：textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右，即从左往右的顺序；
//textDirection的值为TextDirection.rtl，则alignment的start代表右，end代表左，即从右往左的顺序。
//fit：此参数用于确定没有定位的子组件如何去适应Stack的大小。
//StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
//overflow：此属性决定如何显示超出Stack显示空间的子组件；
//值为Overflow.clip时，超出部分会被剪裁（隐藏），值为Overflow.visible时则不会。
class StackDemo extends StatelessWidget {
  _getStack1() {
    return Stack(
      alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
      children: <Widget>[
        Container(
          //未定位，就是完全center
          child: Text("Hello world", style: TextStyle(color: Colors.white)),
          color: Colors.red,
        ),
        Positioned(
          //横轴定位了，纵轴方向center
          left: 18.0,
          child: Text("I am Jack"),
        ),
        Positioned(
          //纵轴定位了，横轴方向center
          top: 18.0,
          child: Text("Your friend"),
        )
      ],
    );
  }

  /**
   * 在getStack1上指定一个fit属性，然后将三个子文本组件的顺序调整一下
   */
  _getStack2(){
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand, //未定位widget占满Stack整个空间
      children: <Widget>[
        Positioned(
          left: 18.0,
          child: Text("I am Jack"),
        ),
        Container(
          //未定位，将占满Stack整个空间，
          //同时由于Stack子元素是堆叠的，所以第一个子文本组件被第二个遮住了，
          //而第三个在最上层，所以可以正常显示。
          child:
          Text("Hello world", style: TextStyle(color: Colors.white)),
          color: Colors.red,
        ),
        Positioned(
          top: 18.0,
          child: Text("Your friend"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Stack Demo"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: _getStack2(),
      ),
    );
  }
}
