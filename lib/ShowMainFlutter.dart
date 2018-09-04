import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_program/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_five/FiveFramgent.dart';
import 'package:flutter_program/fragment_four/FourFramgent.dart';
import 'package:flutter_program/fragment_one/OrderPagerFragment.dart';
import 'package:flutter_program/fragment_second/SencondFramgent.dart';
import 'package:flutter_program/fragment_six/SixFramgent.dart';
import 'package:flutter_program/fragment_thread/ThreadFramgent.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabImages;
  var appBarTitles = ['工单', '为了', '管理设备', '管理设备', '计划', '我的'];
  BuildContext context;
  int _currentPageIndex = 0;
  GlobalKey _myKey = new GlobalKey();
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
          style: new TextStyle(fontSize: 13.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 13.0, color: Colors.grey));
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
      [
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_statistics_normal.png'),
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_statistics_pressed.png')
      ],
      [
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_order_normal.png'),
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_order_pressed.png')
      ],
      [
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_eq_normal.png'),
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_eq_pressed.png')
      ],
      [
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_pj_normal.png'),
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_pj_pressed.png')
      ],
      [
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_plan_normal.png'),
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_plan_pressed.png')
      ],
      [
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_mine_normal.png'),
        getTabImage('images/mipmap-hdpi-v4/gteq_icon_mine_pressed.png')
      ],
    ];

    _pageList = new List();
    _pageList.add(new OrderPagerFragment("统计")); //工单
    _pageList.add(new SencondFragment("工单"));
    _pageList.add(new ThreadFramgent("设备管理"));
    _pageList.add(new FourFramgent("设备检查"));
    _pageList.add(new FiveFramgent("计划"));
    _pageList.add(new SixFragment("我的"));
  }

  _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
        key:_myKey,
          content: new Container(
              margin: new EdgeInsets.only(top: 40.0),
              alignment: Alignment.center,
              height:20.0,
              width: MediaQuery.of(context).size.width,
              child: Text('是否退出登录？')),
          actions: <Widget>[
            Container(
              width:MediaQuery.of(context).size.width-96.0,
              child:Column(children: <Widget>[
                Container(width:MediaQuery.of(context).size.width-96.0,color:Colors.black12,height:1.0,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        SystemNavigator.pop();
                      },
                      child: new Text('确定'),
                    ),
                    Container(width:1.0,color:Colors.black12,height:40.0,),
                    new FlatButton(
                      onPressed: () {
                        print(_myKey.currentContext.findRenderObject().semanticBounds.width);
                        print(_myKey.currentContext.findRenderObject().semanticBounds.left);
                        print(_myKey.currentContext.findRenderObject().semanticBounds.right);
                        print(_myKey.currentContext.findRenderObject().semanticBounds.centerLeft);
                        print(_myKey.currentContext.findRenderObject().semanticBounds.centerRight);
                        print("semanticBounds:${_myKey.currentContext.findRenderObject().semanticBounds.size} paintBounds:${_myKey.currentContext.findRenderObject().paintBounds.size} size:${_myKey.currentContext.size}");

                        Navigator.pop(context);
                      },
                      child: Text("取消"),
                    ),
                  ],
                ),
              ],)
            ),
          ]),
    );
  }

  Future<bool> _requestPop() {
    _showDialog();
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    initData();
    return new WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              child: Image.asset(
                "images/mipmap-hdpi-v4/gteq_icon_scan.png",
                width: 28.0,
                height: 28.0,
              ),
              padding: new EdgeInsets.only(right: 13.0),
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
                duration: new Duration(milliseconds: 500),
                curve: new ElasticOutCurve(0.8));
            _pageChange(index);
          },
        ),
      ),
    );
  }
}
