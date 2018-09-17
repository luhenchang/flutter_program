import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ManagerTools extends StatefulWidget {
  String title;

  ManagerTools(var title) {
    this.title = title;
  }

  @override
  _ManagerToolsState createState() => new _ManagerToolsState(title);
}

class _ManagerToolsState extends State<ManagerTools> {
  String title;

  _ManagerToolsState(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    var screen_height = MediaQuery.of(context).size.height;

    return new Scaffold(
      appBar: AppBar(
        elevation:0.0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.chevron_left,
            size: 29.0,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "管理工具",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child: ListView(
          children: <Widget>[
            //第三部分
            InkWell(
              onTap: () {
                //设备管理
                Fluttertoast.showToast(
                    msg: "  清除成功 ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    bgcolor: '#1C61D5',
                    textcolor: '#ffffff');
              },
              child: Container(
                color: Colors.white,
                padding: new EdgeInsets.only(
                  left: 10.0,
                  right: 7.0,
                ),
                height: 42.0,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 10.0),
                      child: Text(
                        "清空数据库",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Container(
                      child: new Row(
                        children: <Widget>[
                          Image.asset(
                            "images/mipmap-xhdpi-v4/gteq_icon_main_go.png",
                            height: 15.0,
                            width: 18.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black12,
              height:5.0,
              width: screen_width,
            ),
            InkWell(
              onTap: () {
                //设备管理
                Fluttertoast.showToast(
                    msg: "  清除成功 ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    bgcolor: '#1C61D5',
                    textcolor: '#ffffff');
              },
              child: Container(
                color: Colors.white,
                padding: new EdgeInsets.only(
                  left: 10.0,
                  right: 7.0,
                ),
                height: 42.0,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 10.0),
                      child: Text(
                        "清理缓存数据",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Container(
                      child: new Row(
                        children: <Widget>[
                          Image.asset(
                            "images/mipmap-xhdpi-v4/gteq_icon_main_go.png",
                            height: 15.0,
                            width: 18.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black12,
              height:1.2,
              width: screen_width,
            ),
            InkWell(
              onTap: () {
                //设备管理
              },
              child: Container(
                color: Colors.white,
                padding: new EdgeInsets.only(
                  left: 10.0,
                  right: 7.0,
                ),
                height: 42.0,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 10.0),
                      child: Text(
                        "上传设备图片",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Container(
                      child: new Row(
                        children: <Widget>[
                          Image.asset(
                            "images/mipmap-xhdpi-v4/gteq_icon_main_go.png",
                            height: 15.0,
                            width: 18.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black12,
              height:1.0,
              width: screen_width,
            ),
          ],
        ),
      ),
    );
  }
}
