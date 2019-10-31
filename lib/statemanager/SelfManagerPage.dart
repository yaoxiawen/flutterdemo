import 'package:flutter/material.dart';

//Widget管理自身状态
class SelfManagerPage extends StatefulWidget {
  @override
  _SelfManagerState createState() {
    return _SelfManagerState();
  }
}

class _SelfManagerState extends State<SelfManagerPage> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? "Active" : "Inactive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        height: 200.0,//并没有生效
        width: 200.0,//并没有生效
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}
