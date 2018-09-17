// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/cupertino.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_five/StaticList.dart';
import 'package:flutter_program/fragment_five/bean/FiveBaseBean.dart';
import 'package:flutter_program/fragment_five/bean/FiveBaseBean2.dart';
import 'package:flutter_program/fragment_five/bean/SparePartEntities.dart';
import 'package:flutter_program/fragment_five/bean/UserListBean.dart';
import 'package:flutter_program/fragment_five/view/FragmentXunJianPagerItem1.dart';
import 'package:flutter_program/fragment_five/view/FragmentXunJianPagerItem2.dart';
import 'package:flutter_program/fragment_six/bean/AlreadyAplayBean.dart';
import 'package:flutter_program/fragment_six/view/FaultRepairPager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

// Each TabBarView contains a _Page and for each _Page there is a list
// of _CardData objects. Each _CardData object is displayed by a _CardItem.

class FragmentBaoyang extends StatefulWidget {
  FiveBaseBean2 bean;

  FragmentBaoyang(FiveBaseBean2 bean) {
    this.bean = bean;
  }

  @override
  _FragmentBaoyangState createState() => new _FragmentBaoyangState(this.bean);
}

class Prisize extends StatefulWidget implements PreferredSizeWidget {
  var child;

  @override
  State<StatefulWidget> createState() {
    return _StatePriseze(this.child);
  }

  // TODO: implement preferredSize
  @override
  Size get preferredSize => null;
}

class _StatePriseze extends State<Prisize> {
  var child;

  _StatePriseze(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }
}

class _FragmentBaoyangState extends State<FragmentBaoyang> {
  FiveBaseBean2 bean;
  var _switchValue = false;

  _FragmentBaoyangState(this.bean);

  List<String> choices = new List();
  List<AlreadyAplayBean> dataAlready = new List();
  List<UserListBean> result = new List();
  List<SparePartEntities> result1 = new List();

  @override
  void initState() {
    super.initState();
    print('是么');
    setState(() {
      choices.add('工单信息');
      choices.add('工作量');
      choices.add('更换派件');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
            indicatorColor: Colors.blue, primaryColor: Colors.white),
        home: new Scaffold(
          appBar: new AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              }, //故障申请表
              child: Icon(
                Icons.chevron_left,
                size: 29.0,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
            title: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.blue,
              child: Text(
                bean.name + "保养",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
            actions: <Widget>[
              Center(
                child: Padding(
                  padding: new EdgeInsets.only(right: 20.0),
                  child: Text(
                    '提交',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ),
              )
            ],
            centerTitle: true,
            elevation: 0.0,
          ),
          body: new DefaultTabController(
            length: choices.length,
            child: new Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(40.0),
                child: Container(
                  color: Colors.white,
                  child: new TabBar(
                    indicatorPadding: EdgeInsets.all(0.0),
                    indicatorColor: Colors.blue,
                    isScrollable: true,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    tabs: choices.map((String choice) {
                      return new Container(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width / 3 - 30,
                        child: new Tab(
                          text: choice,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              body: new TabBarView(
                key: new Key('Home Page'),
                children: choices.map((String choice) {
                  return choice == '工单信息'
                      ? new Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 10.0,
                                          color: Colors.black12,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("设备编号"),
                                                  ),
                                                  Text(bean.name),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("设备类型"),
                                                  ),
                                                  Text(bean.equipmentTypeName),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("规格型号"),
                                                  ),
                                                  Text(bean.specModels),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("所在部门"),
                                                  ),
                                                  Text(bean.deptName),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("接收人"),
                                                  ),
                                                  Text(bean.operationStaff),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("设备编号"),
                                                  ),
                                                  Text(bean.number),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("安装地点"),
                                                  ),
                                                  Text(bean.installationSite),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("包养级别"),
                                                  ),
                                                  Text(bean.name),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("是否停机"),
                                                  ),
                                                  new CupertinoSwitch(
                                                    value: _switchValue,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        _switchValue = value;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("停机时长"),
                                                  ),
                                                  Text('0.0'),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("包养图片"),
                                                  ),
                                                  Text('2张'),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 80.0),
                                                    child: Text("检查项目"),
                                                  ),
                                                  Text(""),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 10.0),
                                                    child: Text("检查项目进度"),
                                                  ),
                                                  Container(
                                                    margin: new EdgeInsets.only(
                                                      left: 40.0,
                                                    ),
                                                    color: Colors.black12,
                                                    width: 120.0,
                                                    height: 3.0,
                                                    /*child: LinearProgressIndicator(
                                                value: 90.0,
                                                backgroundColor: Colors.black12,
                                              ),*/
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 50.0),
                                                    child: Text("计划开始时间"),
                                                  ),
                                                  Text(bean.planStartTime),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 50.0),
                                                    child: Text("计划结束时间"),
                                                  ),
                                                  Text(bean.planEndTime),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          //备件列表
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 50.0),
                                                    child: Text("实际开始时间"),
                                                  ),
                                                  Text(bean.planEndTime),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              height: 41.0,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    padding:
                                                        new EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 50.0),
                                                    child: Text("实际完成时间"),
                                                  ),
                                                  Text(bean.planEndTime),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.black26,
                                              height: 1.0,
                                            )
                                          ],
                                        ),
                                        Container(
                                          height: 41.0,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            new Container(
                              height: 35.0,
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromRGBO(45, 46, 55, 22.0),
                              child: Center(
                                child: Text(
                                  "保存",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        )
                      : choice == '工作量'
                          ? Container(
                              margin: new EdgeInsets.only(top: 10.0),
                              color: Colors.black12,
                              child: Stack(
                                children: <Widget>[
                                  new InkWell(
                                    onTap: () {
                                      //设备管理
                                      Navigator.of(context).push(
                                          new PageRouteBuilder(
                                        pageBuilder:
                                            (BuildContext context, _, __) {
                                          return new FragmentXunJianPagerItem1();
                                        },
                                      )).then((vlue) => setState(() {
                                            result.clear();
                                            for (int i = 0;
                                                i < StaticList.mdataUser.length;
                                                i++) {
                                              if (StaticList
                                                  .mdataUser[i].isSelected) {
                                                result.add(
                                                    StaticList.mdataUser[i]);
                                                print(StaticList
                                                    .mdataUser[i].fullname);
                                              }
                                              /* if (StaticList.mdataUser[i].isSelected) {
                                          print("gg2" + StaticList.mdataUser[i].fullname);
                                          result.add(StaticList.mdataUser[i]);
                                          print("gg3" + result[i].fullname);
                                        }*/
                                            }
                                          }));
                                    },
                                    child: Container(
                                      margin: new EdgeInsets.only(bottom: 45.0),
                                      height: 43.0,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.add,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            '增加人员',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 50.0),
                                    child: ListView.builder(
                                        itemCount: result.length,
                                        itemBuilder:
                                            (BuildContext context, index) {
                                          return Container(
                                            color: Colors.white,
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10.0,
                                                          top: 10.0),
                                                      child: Image.asset(
                                                        'images/mipmap-xhdpi-v4/gteq_head_portrait.png',
                                                        height: 27.0,
                                                        width: 27.0,
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10.0,
                                                          top: 10.0),
                                                      child: Text(
                                                        result[index].fullname,
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 50.0, top: 8.0),
                                                      child: Text('维修开始时间:'),
                                                    ),
                                                    Text(""),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 50.0, top: 8.0),
                                                      child: Text('维修完成时间:'),
                                                    ),
                                                    Text(""),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 50.0, top: 8.0),
                                                      child: Text('维修时间:'),
                                                    ),
                                                    Text(""),
                                                  ],
                                                ),
                                                Container(
                                                  margin: new EdgeInsets.only(
                                                      top: 16.0),
                                                  height: 10.0,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              margin: new EdgeInsets.only(top: 10.0),
                              color: Colors.black12,
                              child: Stack(
                                children: <Widget>[
                                  new InkWell(
                                    onTap: () {
                                      //设备管理
                                      Navigator.of(context)
                                          .push(new PageRouteBuilder(
                                        pageBuilder:
                                            (BuildContext context, _, __) {
                                          return new FragmentXunJianPagerItem2();
                                        },
                                      )).then((vlue) => setState(() {
                                                result1.clear();
                                                for (int i = 0;
                                                    i <
                                                        StaticList.mPaijianData1
                                                            .length;
                                                    i++) {
                                                  if (StaticList
                                                      .mPaijianData1[i]
                                                      .isSelected) {
                                                    result1.add(StaticList
                                                        .mPaijianData1[i]);
                                                    print("sb" +
                                                        StaticList
                                                            .mPaijianData1[i]
                                                            .name);
                                                  }
                                                  /* if (StaticList.mdataUser[i].isSelected) {
                                          print("gg2" + StaticList.mdataUser[i].fullname);
                                          result.add(StaticList.mdataUser[i]);
                                          print("gg3" + result[i].fullname);
                                        }*/
                                                }
                                              }));
                                    },
                                    child: Container(
                                      margin: new EdgeInsets.only(bottom: 45.0),
                                      height: 43.0,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.add,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            '增加配件',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 50.0),
                                    child: ListView.builder(
                                        itemCount: result1.length,
                                        itemBuilder:
                                            (BuildContextcontext, index) {
                                          return Container(
                                            color: Colors.white,
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30.0,
                                                          top: 10.0),
                                                      child: Text(
                                                        result1[index].name,
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30.0, top: 8.0),
                                                      child: Text('备件编号:'),
                                                    ),
                                                    Text(
                                                      result1[index].number,
                                                      style: TextStyle(
                                                          fontSize: 16.0),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30.0, top: 8.0),
                                                      child: Text('规格型号:'),
                                                    ),
                                                    Text(
                                                      result1[index].specModels,
                                                      style: TextStyle(
                                                          fontSize: 16.0),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30.0, top: 8.0),
                                                      child: Text('库存数量:' +
                                                          result1[index]
                                                              .currRepertory
                                                              .toString()),
                                                    ),
                                                    Text(""),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30.0, top: 8.0),
                                                      child: Text('更换数量:' +
                                                          result1[index]
                                                              .delFlag
                                                              .toString()),
                                                    ),
                                                    Text(""),
                                                  ],
                                                ),
                                                Container(
                                                  margin: new EdgeInsets.only(
                                                      top: 16.0),
                                                  height: 10.0,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            );
                }).toList(),
              ),
            ),
          ),
        ));
  }
}
