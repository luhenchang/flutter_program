import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_five/bean/FiveBaseBean.dart';
import 'package:flutter_program/fragment_five/bean/FiveBaseBean2.dart';
import 'package:flutter_program/fragment_five/view/FragmentBaoyang.dart';
import 'package:flutter_program/fragment_six/bean/AlreadyAplayBean.dart';
import 'package:flutter_program/fragment_six/view/RepairInformationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaoYangPager extends StatefulWidget {
  List<FiveBaseBean2> dataAlready;

  BaoYangPager(this.dataAlready);

  @override
  _BaoYangPagerState createState() => new _BaoYangPagerState(dataAlready);
}

class _BaoYangPagerState extends State<BaoYangPager>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<FiveBaseBean2> dataAlready = new List();
  double toalTime;

  _BaoYangPagerState(this.dataAlready);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        centerTitle: true,
        title: Text('保养工单'),
      ),
      body: Container(
        color:Colors.black12,
        child: new ListView.builder(
          itemCount: dataAlready.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //设备管理
                Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new FragmentBaoyang(dataAlready[index]);
                  },
                ));
              },
              child: Container(
                margin:new EdgeInsets.only(top:index==0?10.0:0.0,bottom:index==dataAlready.length-1?10.0:0.0),
                color:Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 41.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding:
                                new EdgeInsets.only(left:10.0, right: 80.0),
                            child: Text(
                              dataAlready[index].maintainNumber,
                              style: TextStyle(color: Colors.blue,fontWeight:FontWeight.w400),
                            ),
                          ),
                          Container(
                            padding:
                                new EdgeInsets.only(left: 5.0, right: 10.0),
                            child: Image.asset(
                              "images/mipmap-xhdpi-v4/gteq_icon_main_go.png",
                              width: 18.0,
                              height: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.only(left: 10.0, right: 10.0),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black26,
                      height: 1.0,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height:30.0,
                          margin: new EdgeInsets.only(left: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Text("设备名称:"+dataAlready[index].name,style: TextStyle(color: Colors.black38,fontWeight:FontWeight.w400),),
                        ),
                        Container(
                          height:30.0,
                          margin: new EdgeInsets.only(left: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Text("设备型号:"+dataAlready[index].equipmentTypeName,style: TextStyle(color: Colors.black38,fontWeight:FontWeight.w400),),
                        ),
                        Container(
                          height:30.0,
                          margin: new EdgeInsets.only(left: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Text("设备编号:"+dataAlready[index].number,style: TextStyle(color: Colors.black38,fontWeight:FontWeight.w400),),
                        ),
                        Container(
                          height:30.0,
                          margin: new EdgeInsets.only(left: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Text("规格型号:"+dataAlready[index].specModels,style: TextStyle(color: Colors.black38,fontWeight:FontWeight.w400),),
                        ),
                        Container(
                          height:30.0,
                          margin: new EdgeInsets.only(left: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Text("计划开始时间:"+dataAlready[index].planStartTime,style: TextStyle(color: Colors.black38,fontWeight:FontWeight.w400),),
                        ),
                        Container(
                          height:30.0,
                          margin: new EdgeInsets.only(left: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Text("计划完成时间:"+dataAlready[index].planEndTime,style: TextStyle(color: Colors.black38,fontWeight:FontWeight.w400),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
