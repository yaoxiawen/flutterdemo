import 'package:flutter/material.dart';

class ListViewDemoPage extends StatefulWidget {
  @override
  _ListViewDemoPageState createState() {
    return _ListViewDemoPageState();
  }
}

class _ListViewDemoPageState extends State<ListViewDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("YXW ListView Demo"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return DemoItem();
        },
        itemCount: 20,
      ),
    );
  }
}

class DemoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: FlatButton(
            onPressed: () {
              print('点击了哦');
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      "这是一点描述",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.only(top: 6, bottom: 2),
                    alignment: Alignment.topLeft,
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getBottomItem(Icons.star, "1000"),
                      _getBottomItem(Icons.link, "1000"),
                      _getBottomItem(Icons.subject, "1000")
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  _getBottomItem(IconData icon, String text) {
    return Expanded(
        flex: 1,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 16,
                color: Colors.grey,
              ),
              Padding(padding: EdgeInsets.only(left: 5)),
              Text(
                text,
                style: TextStyle(color: Colors.grey, fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        )
    );
  }
}
