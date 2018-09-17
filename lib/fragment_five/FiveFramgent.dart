import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_five/StaticList.dart';
import 'package:flutter_program/fragment_five/bean/FiveBaseBean.dart';
import 'package:flutter_program/fragment_five/bean/FiveBaseBean2.dart';
import 'package:flutter_program/fragment_five/bean/FiveBean.dart';
import 'package:flutter_program/fragment_five/bean/SparePartEntities.dart';
import 'package:flutter_program/fragment_five/bean/UserListBean.dart';
import 'package:flutter_program/fragment_five/view/BaoYangPager.dart';
import 'package:flutter_program/fragment_five/view/FivePagerItem.dart';
import 'package:flutter_program/fragment_five/view/XunJianPager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class FiveFramgent extends StatefulWidget {
  String title;

  FiveFramgent(var title) {
    this.title = title;
  }

  @override
  _FiveFramgentState createState() => new _FiveFramgentState(title);
}

class _FiveFramgentState extends State<FiveFramgent> {
  @override
  String title;
  List<FiveBean> mdata = new List();
  List<FiveBaseBean2> baseData1 = new List();
  List<FiveBaseBean> baseData = new List();
  List<UserListBean> userData = new List();
  List<SparePartEntities>paijiaData=new List();

  _FiveFramgentState(String title) {
    this.title = title;
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    /*
    POST http://118.25.173.88:8080/tpm//workorder/repairsheetlist/getOfflineData HTTP/1.1
    Accept-Language: zh-CN,zh;q=0.8
    User-Agent: Mozilla/5.0 (Linux; U; Android 8.0.0; zh-cn; SM-G9500 Build/R16NW) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
    Content-Type: application/x-www-form-urlencoded
    Content-Length: 0
    Host: 118.25.173.88:8080
    Connection: Keep-Alive
    Accept-Encoding: gzip
    Cookie: JSESSIONID=110c013d-b0b7-406f-bba9-db957c8e34a0; rememberMe=deleteMe
   * */
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
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

      var response =
          await dio.post("/tpm//workorder/repairsheetlist/getOfflineData");
      print("haha=" + response.data.toString());
      int count = response.data['routingInspectionListEntities'].length;
      int count1 = response.data['maintainWorkorderEntityList'].length;
      int count2 = response.data['sysUserEntities'].length;
      int count3 = response.data['sparePartEntities'].length;

      /*
      * /*
routingInspectionNumber=20180820180502_00000004
name=松下点胶机
equipmentTypeName=点胶机
number=SB-DJJ-033
specModels=HDPV
planStartTime=2018-08-20 15:00:00
planEndTime=2018-08-20 16:00:00

deptName=宁波SMT车间
operationStaff=李友德
installationSite=SMT-闲置区
routingInspectionLevelName=巡检类型
isStoped=0
stopTime=(null)
createDate=2018-08-20 18:05:02
workloadEndTime=2018-09-06 12:14:33
workloadStartTime=2018-09-06 12:14:28
*/
      * */
      setState(() {
        for (var i = 0; i < count1; i++) {
          FiveBaseBean2 alreadyAplayBean1 = new FiveBaseBean2(
            maintainNumber: response.data['maintainWorkorderEntityList'][i]
                    ["maintainWorkorderNumber"]
                .toString(),
            name: response.data['maintainWorkorderEntityList'][i]["name"]
                .toString(),
            equipmentTypeName: response.data['maintainWorkorderEntityList'][i]
                    ["equipmentTypeName"]
                .toString(),
            number: response.data['maintainWorkorderEntityList'][i]["number"]
                .toString(),
            specModels: response.data['maintainWorkorderEntityList'][i]
                    ["specModels"]
                .toString(),
            planStartTime: response.data['maintainWorkorderEntityList'][i]
                    ["planStartTime"]
                .toString(),
            planEndTime: response.data['maintainWorkorderEntityList'][i]
                    ["planEndTime"]
                .toString(),
            deptName: response.data['maintainWorkorderEntityList'][i]
                    ["deptName"]
                .toString(),
            operationStaff: response.data['maintainWorkorderEntityList'][i]
                    ["operationStaff"]
                .toString(),
            installationSite: response.data['maintainWorkorderEntityList'][i]
                    ["installationSite"]
                .toString(),
            maintainLevelName: response.data['maintainWorkorderEntityList'][i]
                    ["maintainLevelName"]
                .toString(),
            isStoped: response.data['maintainWorkorderEntityList'][i]
                ["isStoped"],
            stopTime: response.data['maintainWorkorderEntityList'][i]
                    ["stopTime"]
                .toString(),
            createDate: response.data['maintainWorkorderEntityList'][i]
                    ["createDate"]
                .toString(),
          );
          print('aiaiaia=' +
              response.data['maintainWorkorderEntityList'][i]["maintainNumber"]
                  .toString());
          baseData1.add(alreadyAplayBean1);
        }
        for (var i = 0; i < count; i++) {
          FiveBaseBean alreadyAplayBean = new FiveBaseBean(
            routingInspectionNumber: response
                .data['routingInspectionListEntities'][i]
                    ["routingInspectionNumber"]
                .toString(),
            name: response.data['routingInspectionListEntities'][i]["name"]
                .toString(),
            equipmentTypeName: response.data['routingInspectionListEntities'][i]
                    ["equipmentTypeName"]
                .toString(),
            number: response.data['routingInspectionListEntities'][i]["number"]
                .toString(),
            specModels: response.data['routingInspectionListEntities'][i]
                    ["specModels"]
                .toString(),
            planStartTime: response.data['routingInspectionListEntities'][i]
                    ["planStartTime"]
                .toString(),
            planEndTime: response.data['routingInspectionListEntities'][i]
                    ["planEndTime"]
                .toString(),
            deptName: response.data['routingInspectionListEntities'][i]
                    ["deptName"]
                .toString(),
            operationStaff: response.data['routingInspectionListEntities'][i]
                    ["operationStaff"]
                .toString(),
            installationSite: response.data['routingInspectionListEntities'][i]
                    ["installationSite"]
                .toString(),
            routingInspectionLevelName: response
                .data['routingInspectionListEntities'][i]
                    ["routingInspectionLevelName"]
                .toString(),
            isStoped: response.data['routingInspectionListEntities'][i]
                ["isStoped"],
            stopTime: response.data['routingInspectionListEntities'][i]
                    ["stopTime"]
                .toString(),
            createDate: response.data['routingInspectionListEntities'][i]
                    ["createDate"]
                .toString(),
          );
          print('aiaiaia=' +
              response.data['routingInspectionListEntities'][i]
                      ["routingInspectionNumber"]
                  .toString());
          baseData.add(alreadyAplayBean);
        }

        //用户列表
        for (var i = 0; i < count2; i++) {
          UserListBean alreadyAplayBean3 = new UserListBean(
            fullname: response.data['sysUserEntities'][i]["fullname"],
            createDate: response.data['sysUserEntities'][i]["createDate"],
            updateDate: response.data['sysUserEntities'][i]["updateDate"],
            userId: response.data['sysUserEntities'][i]["userId"],
            workloadTimeSum:
                response.data['sysUserEntities'][i]["workloadTimeSum"] == null
                    ? ""
                    : response.data['sysUserEntities'][i]["workloadTimeSum"],
          );
          userData.add(alreadyAplayBean3);
        }
        if (StaticList.mdataUser.length > 0) {
          StaticList.mdataUser.clear();
        }
        StaticList.mdataUser.addAll(userData);
        //跟换配件
        for (var i = 0; i < count3; i++) {
          SparePartEntities alreadyAplayBean4 = new SparePartEntities(
            name: response.data['sparePartEntities'][i]["name"],
            number: response.data['sparePartEntities'][i]["number"],
            specModels: response.data['sparePartEntities'][i]["specModels"],
            currRepertory: response.data['sparePartEntities'][i]["currRepertory"],
            delFlag:response.data['sparePartEntities'][i]["delFlag"]);
          paijiaData.add(alreadyAplayBean4);
        }
        if (StaticList.mPaijianData.length > 0) {
          StaticList.mPaijianData.clear();
        }
        StaticList.mPaijianData.addAll(paijiaData);


        print('enens'+StaticList.mdataUser[0].fullname);
        FiveBean FiveBean1 = new FiveBean(count.toString(), "巡检工单",
            "images/mipmap-xhdpi-v4/gteq_icon_main_inspect.png");
        mdata.add(FiveBean1);
        FiveBean FiveBean2 = new FiveBean(count1.toString(), "保养工单",
            "images/mipmap-xhdpi-v4/gteq_icon_main_upkeep.png");
        mdata.add(FiveBean2);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery.of(context).size.width;
    var screen_height = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: Container(
        color: Color(0xFFEEEEEE),
        child: ListView.builder(
            itemCount: mdata.length,
            itemBuilder: (BuildContext content, int index) {
              return InkWell(
                onTap: () {
                  //设备管理
                  Navigator.of(context).push(new PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) {
                      return index == 0
                          ? new XunJianPager(baseData)
                          : new BaoYangPager(baseData1);
                    },
                  ));
                },
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  height: 60.0,
                  child: Column(
                    children: <Widget>[
                      FivePagerItem(mdata[index].image_url, mdata[index].title,
                          mdata[index].subjects),
                      Divider(
                        height: 4.0,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
