import 'package:flutter/material.dart';

class SwitchAndCheckboxDemo extends StatefulWidget {
  @override
  SwitchAndCheckboxState createState() {
    return SwitchAndCheckboxState();
  }
}

class SwitchAndCheckboxState extends State<SwitchAndCheckboxDemo> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12),
        child: Column(
          children: <Widget>[
            Switch(
              value: _switchSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
