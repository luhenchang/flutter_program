// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_six/bean/AlreadyAplayBean.dart';
import 'package:flutter_program/fragment_six/view/FaultRepairPager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Each TabBarView contains a _Page and for each _Page there is a list
// of _CardData objects. Each _CardData object is displayed by a _CardItem.

class FaultAplayPager extends StatefulWidget {
  String title;

  ManagerTools(var title) {
    this.title = title;
  }

  @override
  _FaultAplayPagerState createState() => new _FaultAplayPagerState();
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

class _FaultAplayPagerState extends State<FaultAplayPager> {
  List<String> choices = new List();
  List<AlreadyAplayBean> dataAlready = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      choices.add('已提交');
      choices.add('未提交');
    });
    _loadData();
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
            title: Text(
              '我的故障申请',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
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
                    indicatorColor: Colors.blue,
                    isScrollable: true,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    tabs: choices.map((String choice) {
                      return new Container(
                        height: 40.0,
                        width: 154.0,
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
                  return new ListView.builder(
                    itemCount: choice == '已提交' ? 0 : dataAlready.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(new PageRouteBuilder(
                            pageBuilder: (BuildContext context, _, __) {
                              return new FaultRepairPager(
                                  dataAlready[index]); //故障报修FaultRepairPager
                            },
                          ));
                        },
                        child: Container(
                          margin: new EdgeInsets.only(
                              top: index == 0 ? 6.0 : 0.0,
                              bottom:
                                  index == dataAlready.length - 1 ? 20.0 : 0.0),
                          child: Card(
                            elevation: 3.0,
                            child: Container(
                              color: Colors.white,
                              margin: new EdgeInsets.only(
                                  top: 10.0, right: 10.0, left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: new EdgeInsets.only(
                                        top: 5.0, left: 10.0, bottom: 5.0),
                                    child: Text(
                                      dataAlready[index].equipmentName,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  Container(
                                    padding: new EdgeInsets.only(
                                        top: 5.0, left: 10.0, bottom: 5.0),
                                    child: Text(
                                      "设备编号: " +
                                          dataAlready[index].equipmentNum,
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: new EdgeInsets.only(
                                            top: 5.0, left: 10.0, bottom: 5.0),
                                        child: Text(
                                          "规格型号: " +
                                              dataAlready[index].specModels,
                                          style: TextStyle(
                                              color: Colors.black26,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                          'images/mipmap-xhdpi-v4/gteq_icon_main_go.png',
                                          height: 15.0,
                                          width: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: new EdgeInsets.only(
                                        top: 5.0, left: 10.0, bottom: 5.0),
                                    child: Text(
                                      "记录时间: " + dataAlready[index].createDate,
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: new EdgeInsets.only(
                                            top: 5.0, left: 10.0, bottom: 10.0),
                                        child: Text(
                                          "单据状态: " + dataAlready[index].state,
                                          style: TextStyle(
                                              color: Colors.black26,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14.0),
                                        ),
                                      ),
                                      Card(
                                        //维修
                                        margin:
                                            new EdgeInsets.only(right: 25.0),
                                        color: Colors.teal,
                                        child: Container(
                                          margin: new EdgeInsets.only(
                                              left: 10.0,
                                              right: 10.0,
                                              top: 4.0,
                                              bottom: 4.0),
                                          child: Text(
                                            '撤销',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ));
  }

  /*
    * POST http://118.25.173.88:8080/tpm/workorder/repairsheetlist/myApplyRepair HTTP/1.1
      Cookie: JSESSIONID=1f926444-b5ca-4a19-a236-b46fbc40466b; rememberMe=deleteMe
      limit=10&page=1
    * */
  void _loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var dio = new Dio();
    //print("lai="+preferences.getString("JSESSIONID"));
    dio.options.baseUrl = "http://118.25.173.88:8080";
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;
    //dio.options.headers["JSESSIONID"] = preferences.getString("JSESSIONID");
    dio.interceptor.request.onSend = (Options options) {
      print('cookiess:=' + preferences.getString("Cookie"));
      options.headers["Cookie"] = preferences.getString("Cookie");
      return options;
    };

    var response = await dio.post(
        "/tpm/workorder/repairsheetlist/myApplyRepair",
        data: {"limit": 10, "page": 1});
    print("haha=" + response.data.toString());
    int count = response.data['page']['list'].length;
    List lists = new List();

    var lh = lists.length;

    setState(() {
      for (var i = 0; i < count; i++) {
        int states=response.data['page']['list'][i]['state'];
        String stateString;
        if(states==-1){
          stateString="已撤销";
        }else if(states==0){
          stateString="暂停中";
        }else if(states==1){
          stateString="未审核";
        }else if(states==2){
          stateString="待分配";
        }else if(states==3){
          stateString="待接收";
        }else if(states==4){
          stateString="处理中";
        }else if(states==5){
          stateString="待确认";
        }else if(states==6){
          stateString="已完成";
        }
        AlreadyAplayBean alreadyAplayBean = new AlreadyAplayBean(
          /*  var equipmentName;
  var equipmentNum;
  var createDate;
  var specModels;
  var state;
  var repairTime;
  var endTime;
  var createByName;
  var repairSheetNum;
  var workloadStartTime;
  var workloadEndTime;
  var auditingDate;
  var equipmentTypeName;
  var deptName;
  var installationSite;
  var faultName;*/
            response.data['page']['list'][i]['equipmentName'].toString(),
            response.data['page']['list'][i]['equipmentNum'].toString(),
            response.data['page']['list'][i]['createDate'].toString(),
            response.data['page']['list'][i]['specModels'].toString(),
            stateString,
            response.data['page']['list'][i]['repairTime'].toString(),
            response.data['page']['list'][i]['endTime'].toString(),
            response.data['page']['list'][i]['createByName'].toString(),
            response.data['page']['list'][i]['repairSheetNum'].toString(),
            response.data['page']['list'][i]['workloadStartTime'].toString(),
            response.data['page']['list'][i]['workloadEndTime'].toString(),
            response.data['page']['list'][i]['auditingDate'].toString(),
            response.data['page']['list'][i]['equipmentTypeName'].toString(),
            response.data['page']['list'][i]['deptName'].toString(),
            response.data['page']['list'][i]['installationSite'].toString(),
            response.data['page']['list'][i]['faultName'].toString());
        dataAlready.add(alreadyAplayBean);
      }
    });
  }
}
