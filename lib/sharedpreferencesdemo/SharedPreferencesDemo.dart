import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  @override
  SharedPreferencesState createState() {
    return SharedPreferencesState();
  }
}

class SharedPreferencesState extends State<SharedPreferencesDemo> {
  int _counter;

  _initCounter() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    //sp.remove("counter");
    setState(() {
      _counter = sp.getInt("counter") ?? 0;
    });
  }

  _incrementCounter() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      _counter = (sp.getInt("counter") ?? 0) + 1;
    });
    print("pressed $_counter times");
    sp.setInt("counter", _counter);
  }

  @override
  void initState() {
    super.initState();
    _initCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW SharedPreferences Demo"),
      ),
      body: Container(
          margin: EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                onPressed: _incrementCounter,
                child: Text("pressed times: $_counter"),
              )
            ],
          )),
    );
  }
}
