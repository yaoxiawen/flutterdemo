import 'package:flutter/material.dart';

class DialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YXW Dialog Demo"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                //弹出对话框并等待其关闭
                bool delete = await showAlertDialog(context);
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                  //... 删除文件
                }
              },
              child: Text("AlertDialog"),
            ),
            RaisedButton(
              onPressed: () async {
                //弹出对话框并等待其关闭
                int choose = await showSimpleDialog(context);
                if (choose == 1) {
                  print("选择了中文简体");
                } else {
                  print("选择了美国英语");
                }
              },
              child: Text("SimpleDialog"),
            ),
            RaisedButton(
              onPressed: () {
                showListDialog(context);
              },
              child: Text("Dialog"),
            ),
            RaisedButton(
              onPressed: () async {
                bool delete = await showCustomDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("您确定要删除当前文件吗?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text("删除"),
                          onPressed: () {
                            // 执行删除操作
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                );
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                  //... 删除文件
                }
              },
              child: Text("showGeneralDialog"),
            ),
            RaisedButton(
              onPressed: () {
                showStatefulBuilder(context);
              },
              child: Text("对话框状态管理StatefulBuilder"),
            ),
            RaisedButton(
              onPressed: () {
                showMarkNeedsBuild(context);
              },
              child: Text("对话框状态管理markNeedsBuild"),
            ),
            RaisedButton(
              onPressed: () {
                _showModalBottomSheet(context);
              },
              child: Text("底部菜单列表showModalBottomSheet"),
            ),
            RaisedButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: Text("底部全屏菜单列表showBottomSheet"),
            ),
            RaisedButton(
              onPressed: () {
                showLoadingDialog(context);
              },
              child: Text("showLoadingDialog"),
            ),
            RaisedButton(
              onPressed: () {
                showLoadingDialog2(context);
              },
              child: Text("LoadingDialog限制宽高"),
            ),
            RaisedButton(
              onPressed: () {
                _showDatePicker1(context);
              },
              child: Text("Material风格的日历选择器"),
            ),
          ],
        ),
      ),
    );
  }
}

// AlertDialog，确认对话框
Future<bool> showAlertDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    //点击对话框barrier(遮罩)时是否关闭它,通过点击对话框遮罩关闭的，则Future的值为null
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}

// SimpleDialog，展示一个列表，用于列表选择的场景
Future<int> showSimpleDialog(BuildContext context) {
  return showDialog<int>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('请选择语言'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              // 返回1
              Navigator.pop(context, 1);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Text('中文简体'),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              // 返回2
              Navigator.pop(context, 2);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Text('美国英语'),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> showListDialog(BuildContext context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            ),
          ),
        ],
      );
      //以下三种效果等同
      //return AlertDialog(content: child);
      //return Dialog(child: child);
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 280),
          child: Material(
            child: child,
            type: MaterialType.card,
          ),
        ),
      );
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

//showGeneralDialog
//showDialog方法是Material组件库中提供的一个打开Material风格对话框的方法。
//showGeneralDialog打开一个普通风格的对话框（非Material风格）
//showDialog方法正是showGeneralDialog的一个封装，定制了Material风格对话框的遮罩颜色和动画。
// Material风格对话框打开/关闭动画是一个Fade（渐隐渐显）动画。
Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    //构建对话框内部UI
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    //点击遮罩是否关闭对话框
    barrierDismissible: barrierDismissible,
    // 语义化标签(用于读屏软件)
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    // 自定义遮罩颜色
    barrierColor: Colors.black87,
    // 对话框打开/关闭的动画时长
    transitionDuration: const Duration(milliseconds: 150),
    // 对话框打开/关闭的动画
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

Future<void> showStatefulBuilder(BuildContext context) async {
  bool _withTree = false;
  bool deleteTree = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  //使用StatefulBuilder来构建StatefulWidget上下文
                  StatefulBuilder(
                    builder: (context, _setState) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (value) {
                          //_setState方法实际就是该StatefulWidget的setState方法，
                          //调用后builder方法会重新被调用
                          _setState(() {
                            _withTree = !_withTree;
                          });
                        },
                      );
                    },
                  )
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      });
  if (deleteTree == null) {
    print("取消删除");
  } else {
    print("同时删除子目录: $deleteTree");
  }
}

//StatefulBuilder获取了StatefulWidget的上下文，并代理了其构建过程，
//将setState方法通过builder暴露了出去
//实际上StatefulBuilder正是Flutter SDK中提供的一个类，它和Builder的原理是一样的
class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}

Future<void> showMarkNeedsBuild(BuildContext context) async {
  bool _withTree = false;
  bool deleteTree = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  // 通过Builder来获得构建Checkbox的`context`，
                  // 这是一种常用的缩小`context`范围的方式
                  Builder(
                    builder: (
                      context,
                    ) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    },
                  )
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      });
  if (deleteTree == null) {
    print("取消删除");
  } else {
    print("同时删除子目录: $deleteTree");
  }
}

Future<void> _showModalBottomSheet(BuildContext context) async {
  int index = await showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            ),
          ),
        ],
      );
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

//showBottomSheet是调用widget树顶部的Scaffold组件的ScaffoldState的showBottomSheet同名方法实现，
//也就是说要调用showBottomSheet方法就必须得保证父级组件中有Scaffold。
//方法失败，显示No Scaffold widget found.，不知原因
PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
  return showBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}

showLoadingDialog(BuildContext context) {
  showDialog<int>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

//showDialog中已经给对话框设置了宽度限制
//可以使用UnconstrainedBox先抵消showDialog对宽度的限制，然后再使用SizedBox指定宽度
showLoadingDialog2(BuildContext context) {
  showDialog<int>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return UnconstrainedBox(
        constrainedAxis: Axis.vertical,
        child: SizedBox(
          width: 280,
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 26.0),
                  child: Text("正在加载，请稍后..."),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<DateTime> _showDatePicker1(BuildContext context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add( //未来30天可选
      Duration(days: 30),
    ),
  );
}
