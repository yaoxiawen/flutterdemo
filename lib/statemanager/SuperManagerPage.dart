import 'package:flutter/material.dart';

//父Widget管理子Widget的状态
class SuperManagerPage extends StatefulWidget {
  @override
  _SuperManagerState createState() {
    return _SuperManagerState();
  }
}


class _SuperManagerState extends State<SuperManagerPage> {
  //状态管理_active和_handleTap都在父类中，通过子类的构造函数传给子类
  bool _active = false;

  void _handleTap(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _ChildManagerPage(
        childActive: _active,
        onChanged: _handleTap,
      ),
    );
  }
}

class _ChildManagerPage extends StatelessWidget {
  final bool childActive;
  final ValueChanged<bool> onChanged;

  _ChildManagerPage({Key key, this.childActive: false, @required this
      .onChanged})
      :super(key: key);

  void _childHandleTop(){
    onChanged(!childActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _childHandleTop,
      child: Container(
        child: Center(
          child: Text(
            childActive ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        height: 200.0, //并没有生效
        width: 200.0, //并没有生效
        decoration: BoxDecoration(
            color: childActive ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
