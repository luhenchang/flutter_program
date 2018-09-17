import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_six/bean/AlreadyAplayBean.dart';

class RepairInformationPage extends StatefulWidget {
  AlreadyAplayBean dataAlready;

  RepairInformationPage(this.dataAlready);

  @override
  _RepairInformationPageState createState() =>
      new _RepairInformationPageState(this.dataAlready);
}

class _RepairInformationPageState extends State<RepairInformationPage> {
  AlreadyAplayBean dataAlready;

  _RepairInformationPageState(this.dataAlready);

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
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("设备编号"),
                    ),
                    Text(dataAlready.equipmentNum),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("维修单号"),
                    ),
                    Text(dataAlready.repairSheetNum),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("送修时间"),
                    ),
                    Text(dataAlready.auditingDate),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("维修开始"),
                    ),
                    Text(dataAlready.workloadStartTime),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("维修完成"),
                    ),
                    Text(dataAlready.workloadEndTime),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("维修人员"),
                    ),
                    Text(dataAlready.createByName),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("故障描述"),
                    ),
                    Text(""),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("工作描述"),
                    ),
                    Text(""),
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
          //黑色一个
          Column(
            children: <Widget>[
              Container(
                color:Colors.black26,
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("工作量",style:TextStyle(color: Colors.blue),),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("开始时间"),
                    ),
                    Text(dataAlready.repairTime),
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
                height:44.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(left: 20.0,right:80.0),
                      child: Text("结束时间"),
                    ),
                    Text(dataAlready.endTime),
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
        ],
      ),
    );
  }
}
