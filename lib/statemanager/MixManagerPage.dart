import 'package:flutter/material.dart';

//混合状态管理
class MixManagerPage extends StatefulWidget {
  @override
  _MixManagerState createState() {
    return _MixManagerState();
  }
}

class _MixManagerState extends State<MixManagerPage> {
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

class _ChildManagerPage extends StatefulWidget {
  final bool childActive;
  final ValueChanged<bool> onChanged;

  _ChildManagerPage(
      {Key key, this.childActive: false, @required this.onChanged})
      : super(key: key);

  @override
  _ChildManagerState createState() {
    return _ChildManagerState();
  }
}

class _ChildManagerState extends State<_ChildManagerPage> {
  bool _highlight = false;

  void _childHandleTop() {
    widget.onChanged(!widget.childActive);
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _childHandleTop,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.childActive ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        height: 200.0, //并没有生效
        width: 200.0, //并没有生效
        decoration: BoxDecoration(
            color:
                widget.childActive ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? Border.all(color: Colors.teal[700], width: 10.0)
                : null),
      ),
    );
  }
}
