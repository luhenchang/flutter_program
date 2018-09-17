import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_six/bean/AlreadyAplayBean.dart';

class FaultRepairPager extends StatefulWidget {
  AlreadyAplayBean dataAlready;

  FaultRepairPager(this.dataAlready);

  @override
  _FaultRepairPageState createState() =>
      new _FaultRepairPageState(this.dataAlready);
}

class _FaultRepairPageState extends State<FaultRepairPager> {
  AlreadyAplayBean dataAlready;

  _FaultRepairPageState(this.dataAlready);

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
        backgroundColor: Colors.blue,
        title: Text(
          '维修详情',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.black12,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 41.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text(
                          "选择设备*",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Container(
                        padding: new EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Image.asset(
                          "images/mipmap-xhdpi-v4/gteq_icon_scan_addeqbug.png",
                          width: 23.0,
                          height: 23.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text("设备名称"),
                      ),
                      Text(dataAlready.equipmentName),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text("设备类型"),
                      ),
                      Text(dataAlready.equipmentTypeName == null
                          ? ""
                          : dataAlready.equipmentTypeName),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text("规格型号"),
                      ),
                      Text(dataAlready.specModels),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text("所在部门"),
                      ),
                      Text(dataAlready.deptName == null? ""
                          : dataAlready.deptName),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text("设备编号"),
                      ),
                      Text(dataAlready.equipmentNum == null
                          ? ""
                          : dataAlready.equipmentNum),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text("安装地点"),
                      ),
                      Text(dataAlready.installationSite == null
                          ? ""
                          : dataAlready.installationSite),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text("微信单号"),
                      ),
                      Text(dataAlready.repairSheetNum == null
                          ? ""
                          : dataAlready.repairSheetNum),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: new EdgeInsets.only(left: 20.0, right: 90.0),
                        child: Text("故障图片"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: new EdgeInsets.only(right: 120.0),
                            child: Text("0"),
                          ),
                          Padding(
                            padding: new EdgeInsets.only(left: 30.0),
                            child: Image.asset(
                              'images/mipmap-xhdpi-v4/gteq_icon_main_go.png',
                              height: 18.0,
                              width: 18.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: new EdgeInsets.only(left: 20.0, right: 90.0),
                        child: Text("报修语言"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: new EdgeInsets.only(right: 120.0),
                            child: Text("0"),
                          ),
                          Padding(
                            padding: new EdgeInsets.only(left: 30.0),
                            child: Image.asset(
                              'images/mipmap-xhdpi-v4/gteq_icon_main_go.png',
                              height: 18.0,
                              width: 18.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                        child: Text("紧急程度*"),
                      ),
                      Text("高"),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text("故障名称*"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: new EdgeInsets.only(
                                right: 80.0,
                                top: 10.0,
                                bottom: 4.0,
                                left: 40.0),
                            child: Text("测试"),
                          ),
                          Container(
                            height: 1.0,
                            color: Colors.black26,
                            width: 200.0,
                            margin: EdgeInsets.only(left: 40.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text("故障编码*"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: new EdgeInsets.only(
                                right: 80.0,
                                top: 10.0,
                                bottom: 4.0,
                                left: 40.0),
                            child: Text(""),
                          ),
                          Container(
                            height: 1.0,
                            color: Colors.black26,
                            width: 200.0,
                            margin: EdgeInsets.only(left: 40.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                        padding: new EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text("故障描述*"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: new EdgeInsets.only(
                                right: 80.0,
                                top: 10.0,
                                bottom: 4.0,
                                left: 40.0),
                            child: Text(""),
                          ),
                          Container(
                            height: 1.0,
                            color: Colors.black26,
                            width: 200.0,
                            margin: EdgeInsets.only(left: 40.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
