import 'package:flutter/material.dart';

class IconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Icon Demo"),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.star,
                size: 24,
                color: Colors.greenAccent,
              ),
              Icon(
                Icons.error,
                color: Colors.green,
              ),
              Icon(
                Icons.fingerprint,
                color: Colors.green,
              ),
            ],
          )),
    );
  }
}
