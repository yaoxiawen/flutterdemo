import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class PicDemo extends StatefulWidget {
  PicDemo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PicDemoState createState() => _PicDemoState();
}

class _PicDemoState extends State<PicDemo> {
  GlobalKey rootWidgetKey = GlobalKey();
  List<Uint8List> images = List();
  String text = "";

//  Future<Uint8List> _capturePng() async {
  _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          rootWidgetKey.currentContext.findRenderObject();
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
//      if(result){
//        text = "true";
//      }else{
//        text = "false";
//      }
      Uint8List pngBytes = byteData.buffer.asUint8List();
      images.add(pngBytes);
      setState(() {});
//      return pngBytes;//这个对象就是图片数据
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          RepaintBoundary(
            key: rootWidgetKey,
            child: Image.asset(
              "images/timg.jpeg",
              width: 300.0,
            ),
          ),

          Container(
            height: 10,
          ),

          FlatButton(
            onPressed: () {
              this._capturePng();
            },
            child: Text("截图"),
          ),
//            Text(text),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Image.memory(
                  images[index],
                  width: 300,
//                  fit: BoxFit.cover,
                );
              },
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
