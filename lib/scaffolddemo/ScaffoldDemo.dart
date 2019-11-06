import 'package:flutter/material.dart';

//Scaffold是一个路由页的骨架，我们使用它可以很容易地拼装出一个完整的页面。
//包含
//一个导航栏
//导航栏右边有一个分享按钮
//有一个抽屉菜单
//有一个底部导航
//右下角有一个悬浮的动作按钮
class ScaffoldDemo extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldDemo>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  TabController _tabController;
  final List<String> tab = ["top1", "top2", "top3", "top4"];
  bool _useBottomAppBar = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tab.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("YXW Scaffold Demo"),
        //如果给Scaffold添加了抽屉菜单，
        //默认情况下Scaffold会自动将AppBar的leading设置为菜单按钮，点击它便可打开抽屉菜单。
        //如果想自定义菜单图标，可以手动来设置leading
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        bottom: TabBar(
          //TabBar的tabs属性接受一个Widget数组，表示每一个Tab子菜单，
          //可以自定义，也可以像示例中一样直接使用Tab 组件，它是Material组件库提供的Material风格的Tab菜单。
          tabs: tab
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          isScrollable: true,
          controller: _tabController,
        ),
      ),
      //Material库提供了一个TabBarView组件，通过它不仅可以轻松的实现Tab页，
      //而且可以非常容易的配合TabBar来实现同步切换和滑动状态同步，
      body: TabBarView(
        controller: _tabController,
        children: tab.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
      drawer: new MyDrawer(),
      //抽屉
      bottomNavigationBar: _getBottomAppBar(),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
      floatingActionButtonLocation: _getFloatingActionButtonLocation(),
    );
  }

  _getFloatingActionButtonLocation(){
    if(_useBottomAppBar){
      return FloatingActionButtonLocation.centerDocked;
    }else{
      return FloatingActionButtonLocation.endFloat;
    }
  }

  _getBottomAppBar() {
    if (_useBottomAppBar) {
      return BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(), //中间位置空出
            IconButton(
              icon: Icon(Icons.business),
              onPressed: () {},
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),
      );
    } else {
      return BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
          //4个item会出问题
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        ],
        iconSize: 18,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blue[100],
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/timg.jpeg",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
