import 'package:flutter/material.dart';

//弹性布局
//弹性布局允许子组件按照一定比例来分配父容器空间。
//Flex和Expanded

//Flex组件可以沿着水平或垂直方向排列子组件，
//如果你知道主轴方向，使用Row或Column会方便一些，
//因为Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方基本上都可以使用Row或Column。
//Flex本身功能是很强大的，它也可以和Expanded组件配合实现弹性布局。

//Expanded可以按比例“扩伸” Row、Column和Flex子组件所占用的空间。
//flex参数为弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间。
//如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间。
class FlexDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Flex Demo"),
      ),
      body: Column(
        children: <Widget>[
          //Flex的两个子widget按1：2来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
