import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_second/bean/SecondBean.dart';
import 'package:flutter_program/fragment_six/view/AboutOurPager.dart';
import 'package:flutter_program/fragment_six/view/ChangPassworldPager.dart';
import 'package:flutter_program/fragment_six/view/FaultAplayPager.dart';
import 'package:flutter_program/fragment_six/view/ManagerTools.dart';
import 'package:flutter_program/fragment_six/view/TodayRepairPager.dart';

class SixFragment extends StatefulWidget {
  String title;

  SixFragment(var title) {
    this.title = title;
  }

  @override
  _SixFragmentState createState() => new _SixFragmentState(title);
}

class _SixFragmentState extends State<SixFragment> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String title;
  List<SecondBean> mdata = new List();

  bool backgroundcolor = true;

  _SixFragmentState(String title) {
    this.title = title;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    var screen_height = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: Container(
          color: Color(0xFFEEEEEE),
          child: ListView(
            children: <Widget>[
              //第一个
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: new EdgeInsets.only(
                              left: 13.0, top: 20.0, bottom: 20.0),
                          child: Image.asset(
                            "images/mipmap-xhdpi-v4/gteq_icon_main_people.png",
                            height: 46.0,
                            width: 46.0,
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.only(
                            left: 13.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "李德友 欢迎你",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "PC端地址",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.0),
                              ),
                              Text(
                                "http://www.sese.com",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: new EdgeInsets.only(right: 10.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: new EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        child: Material(
                          child: InkWell(
                            highlightColor: Colors.lightBlueAccent,
                            splashColor: Colors.red,
                            radius: 111.0,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              child: Text(
                                "注销",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(new PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) {
                      return new FaultAplayPager();
                    },
                  ));
                },
                child: Container(
                  color: Colors.white,
                  margin: new EdgeInsets.only(top: 8.0),
                  padding: new EdgeInsets.only(
                    left: 10.0,
                    right: 7.0,
                  ),
                  height: 52.0,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: new Row(
                          children: <Widget>[
                            Image.asset(
                              "images/mipmap-xhdpi-v4/gteq_icon_main_myorder.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            Container(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: Text(
                                "我的保修申请",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
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
                height: 1.0,
                width: screen_width,
              ),
              InkWell(
                onTap: () {
                  //设备管理
                  Navigator.of(context).push(new PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) {
                      return new TodayRepairPager();
                    },
                  ));
                },
                child: Container(
                  color: Colors.white,
                  padding: new EdgeInsets.only(
                    left: 10.0,
                    right: 7.0,
                  ),
                  height: 52.0,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: new Row(
                          children: <Widget>[
                            Image.asset(
                              "images/mipmap-xhdpi-v4/gteq_icon_main_repairlist.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            Container(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: Text(
                                "我的维修记录",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: new Row(
                          children: <Widget>[
                            Image.asset(
                              "images/mipmap-xhdpi-v4/gteq_login_icon_pwd.png",
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
                height: 1.0,
                width: screen_width,
              ),
              //第三部分
              InkWell(
                onTap: () {
                  //设备管理
                  Navigator.of(context).push(new PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) {
                      return new ChangPassworldPager();
                    },
                  ));
                },
                child: Container(
                  margin: new EdgeInsets.only(top: 8.0),
                  color: Colors.white,
                  padding: new EdgeInsets.only(
                    left: 10.0,
                    right: 7.0,
                  ),
                  height: 52.0,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: new Row(
                          children: <Widget>[
                            Image.asset(
                              "images/mipmap-xhdpi-v4/gteq_icon_main_pwd.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            Container(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: Text(
                                "修改密码",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
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
                height: 0.7,
                width: screen_width,
              ),
              InkWell(
                onTap: () {
                  //设备管理
                  Navigator.of(context).push(new PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) {
                      return new ManagerTools("hah");
                    },
                  ));
                },
                child: Container(
                  color: Colors.white,
                  padding: new EdgeInsets.only(
                    left: 10.0,
                    right: 7.0,
                  ),
                  height: 52.0,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: new Row(
                          children: <Widget>[
                            Image.asset(
                              "images/mipmap-xhdpi-v4/gteq_icon_main_syn.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            /*-images/mipmap-xhdpi-v4/gteq_icon_main_syn.png
        - images/mipmap-xhdpi-v4/gteq_icon_main_tool.png
        - images/mipmap-xhdpi-v4/gteq_icon_main_update.png
        - images/mipmap-xhdpi-v4/gteq_icon_main_our.png*/
                            Container(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: Text(
                                "同步数据",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
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
                height: 0.7,
                width: screen_width,
              ),
              InkWell(
                onTap:(){
                  Navigator.of(context).push(new PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) {
                      return new ManagerTools("hah");
                    },
                  ));
                },
                child: Container(
                  color: Colors.white,
                  padding: new EdgeInsets.only(
                    left: 10.0,
                    right: 7.0,
                  ),
                  height: 52.0,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: new Row(
                          children: <Widget>[
                            Image.asset(
                              "images/mipmap-xhdpi-v4/gteq_icon_main_tool.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            Container(
                              padding: new EdgeInsets.only(left: 10.0),
                              child: Text(
                                "管理工具",
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
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
                height: 0.7,
                width: screen_width,
              ),
              Container(
                color: Colors.white,
                padding: new EdgeInsets.only(
                  left: 10.0,
                  right: 7.0,
                ),
                height: 52.0,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: new Row(
                        children: <Widget>[
                          Image.asset(
                            "images/mipmap-xhdpi-v4/gteq_icon_main_update.png",
                            width: 20.0,
                            height: 20.0,
                          ),
                          Container(
                            padding: new EdgeInsets.only(left: 10.0),
                            child: Text(
                              "检查更新",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
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
              Container(
                color: Colors.black12,
                height: 0.7,
                width: screen_width,
              ),
              Material(
                //带给我们Material的美丽风格美滋滋。你也多看看这个布局
                elevation: 2.0,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(new PageRouteBuilder(
                      pageBuilder: (BuildContext context, _, __) {
                        return new AboutOurPager("hah");
                      },
                    ));
                  },
                  splashColor: Colors.black12,
                  child: Ink(
                    height: 50.0,
                    child: Container(
                      color: Colors.white,
                      padding: new EdgeInsets.only(
                        left: 10.0,
                        right: 7.0,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: new Row(
                              children: <Widget>[
                                Image.asset(
                                  "images/mipmap-xhdpi-v4/gteq_icon_main_our.png",
                                  width: 20.0,
                                  height: 20.0,
                                ),
                                Container(
                                  padding: new EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "关于我们",
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ],
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
                ),
              ),
            ],
          )),
    );
  }


}
