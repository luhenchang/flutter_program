import 'package:flutter/material.dart';
import 'package:flutter_program/HomePage.dart';
import 'package:flutter/material.dart';

/*void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}*/

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabImages;
  var appBarTitles = ['工单', '为了', '管理设备', '管理设备', '计划', '我的'];

  int _currentPageIndex = 0;

  var _pageController = new PageController(initialPage: 0);

  List _pageList;

  Image getTabIcon(int curIndex) {
    if (curIndex == _currentPageIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _currentPageIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: Colors.black));
    }
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  void _pageChange(int index) {
    setState(() {
      if (_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

  void initData() {
    tabImages = [
      [getTabImage('images/home.png'), getTabImage('images/home_selected.png')],
      [getTabImage('images/find.png'), getTabImage('images/find_selected.png')],
      [getTabImage('images/mine.png'), getTabImage('images/mine_selected.png')],
      [
        getTabImage('images/mines.png'),
        getTabImage('images/mines_selected.png')
      ],
      [getTabImage('images/home.png'), getTabImage('images/home_selected.png')],
      [getTabImage('images/find.png'), getTabImage('images/find_selected.png')],
    ];

    _pageList = new List();
    _pageList.add(new HomePager("工单"));
    _pageList.add(new HomePager("为了"));
    _pageList.add(new HomePager("设备管理"));
    _pageList.add(new HomePager("设备检查"));
    _pageList.add(new HomePager("计划"));
    _pageList.add(new HomePager("我的"));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading:false,
        actions: <Widget>[
          Padding(
            child: Image.asset(
              "images/sanscl.png",
              width: 28.0,
              height: 28.0,
            ),
            padding: new EdgeInsets.only(right: 10.0),
          ),
        ],
        elevation: 2.0,
        title: new Text("微感科技"),
        centerTitle: true,
      ),
      body: new PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return _pageList[index];
        },
        itemCount: 6,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(
              icon: getTabIcon(2), title: getTabTitle(2)),
          new BottomNavigationBarItem(
              icon: getTabIcon(3), title: getTabTitle(3)),
          new BottomNavigationBarItem(
              icon: getTabIcon(4), title: getTabTitle(4)),
          new BottomNavigationBarItem(
              icon: getTabIcon(5), title: getTabTitle(5)),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: (int index) {
          //_pageController.jumpToPage(index); 没有动画的页面切换
          _pageController.animateToPage(index,
              duration: new Duration(seconds: 2),
              curve: new ElasticOutCurve(0.8));
          _pageChange(index);
        },
      ),
    );
  }
}
