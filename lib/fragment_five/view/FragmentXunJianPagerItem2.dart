import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_five/StaticList.dart';
import 'package:flutter_program/fragment_five/bean/SparePartEntities.dart';
import 'package:flutter_program/fragment_five/bean/UserListBean.dart';

class FragmentXunJianPagerItem2 extends StatefulWidget {
  @override
  _FragmentXunJianPagerItem2State createState() =>
      new _FragmentXunJianPagerItem2State();
}

class _FragmentXunJianPagerItem2State extends State<FragmentXunJianPagerItem2> {
  List<SparePartEntities> userData = new List();

  bool checked_values = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      userData.addAll(StaticList.mPaijianData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 1.0,
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
        title: Text('备件列表'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          new ListView.builder(
            itemCount: StaticList.mdataUser.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                onTap: () {
                  _SavaDataToList(index);
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding:
                                new EdgeInsets.only(left: 20.0, right: 80.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: new EdgeInsets.only(
                                      top: 5.0, bottom: 5.0),
                                  child: Text(
                                    StaticList.mPaijianData[index].name,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                Container(
                                  padding: new EdgeInsets.only(
                                      top: 5.0, bottom: 5.0),
                                  child: Text("设备编号:" +
                                      StaticList.mPaijianData[index].number),
                                ),
                                Container(
                                  padding: new EdgeInsets.only(
                                      top: 5.0, bottom: 5.0),
                                  child: Text("规格型号:" +
                                      StaticList
                                          .mPaijianData[index].specModels),
                                ),
                                Container(
                                  padding: new EdgeInsets.only(
                                      top: 5.0, bottom: 5.0),
                                  child: Text("当前库存:" +
                                      StaticList.mPaijianData[index].delFlag
                                          .toString()),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: new EdgeInsets.only(right:20.0),
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
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _SavaDataToList(var indexs) async {
    StaticList.mPaijianData[indexs].isSelected = true;
    StaticList.mPaijianData1.clear();
    for (int index = 0; index < StaticList.mPaijianData.length; index++) {
      if (StaticList.mPaijianData[index].isSelected) {
        StaticList.mPaijianData1.add(StaticList.mPaijianData[index]);
      }
    }
    //设备管理
    Navigator.of(context).pop();
  }
}
