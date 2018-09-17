import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_six/bean/AlreadyAplayBean.dart';
import 'package:flutter_program/fragment_six/view/RepairInformationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodayRepairPager extends StatefulWidget {
  @override
  _TodayRepairPagerState createState() => new _TodayRepairPagerState();
}

class _TodayRepairPagerState extends State<TodayRepairPager> {
  GlobalKey _myKey = new GlobalKey();
  List<AlreadyAplayBean> dataAlready = new List();
  double toalTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _loadData() async {
    /*
  * POST http://118.25.173.88:8080/tpm/workorder/repairsheetlist/myRepairSheet HTTP/1.1
 Accept-Language: zh-CN,zh;q=0.8
User-Agent: Mozilla/5.0 (Linux; U; Android 8.0.0; zh-cn; SM-G9500 Build/R16NW) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
Content-Type: application/x-www-form-urlencoded
Content-Length: 55
Host: 118.25.173.88:8080
Connection: Keep-Alive
Accept-Encoding: gzip
Cookie: JSESSIONID=6f321b8b-2f79-42a3-847c-55fa229f91e1; rememberMe=deleteMe

limit=10&startTime=2018-09-06&page=1&endTime=2018-09-06
  * */
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

    var response = await dio
        .post("/tpm/workorder/repairsheetlist/myRepairSheet", data: {
      "limit": 10,
      "startTime": 2018 - 09 - 06,
      "endTime": 2018 - 09 - 06,
      "page": 1
    });
    print("haha=" + response.data.toString());
    int count = response.data['page']['list'].length;
    List lists = new List();

    var lh = lists.length;

    setState(() {
      for (var i = 0; i < count; i++) {
        AlreadyAplayBean alreadyAplayBean = new AlreadyAplayBean(
          response.data['page']['list'][i]['equipmentName'].toString(),
          response.data['page']['list'][i]['equipmentNum'].toString(),
          response.data['page']['list'][i]['createDate'].toString(),
          response.data['page']['list'][i]['specModels'].toString(),
          response.data['page']['list'][i]['state'].toString(),
          response.data['page']['list'][i]['repairTime'].toString(),
          response.data['page']['list'][i]['endTime'].toString(),
          response.data['page']['list'][i]['createByName'].toString(),
          response.data['page']['list'][i]['repairSheetNum'].toString(),
          response.data['page']['list'][i]['workloadStartTime'].toString(),
          response.data['page']['list'][i]['workloadEndTime'].toString(),
          response.data['page']['list'][i]['auditingDate'].toString(),


        );

        print(response.data['page']['list'][i]['repairTime'] * 3);
        try {
          toalTime = ++response.data['page']['list'][i]['repairTime'];
          print("toalTime$i=" + "$toalTime");
        } catch (e) {
          print(e.toString());
        }
        print('$toalTime');

        dataAlready.add(alreadyAplayBean);
      }
    });
  }

  _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
          key: _myKey,
          content: new Container(
              margin: new EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              height: 240.0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.only(bottom: 21.0),
                    child: Text(
                      '今日维修',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.9),
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(bottom: 21.0),
                    child: Text(
                      '昨日维修',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.9),
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(bottom: 21.0),
                    child: Text(
                      '本周维修',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.9),
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(bottom: 21.0),
                    child: Text(
                      '上周维修',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.9),
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(bottom: 21.0),
                    child: Text(
                      '本月维修',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.9),
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(bottom: 21.0),
                    child: Text(
                      '上月维修',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.9),
                    ),
                  ),
                ],
              )),
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 96.0,
              child: new FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("取消"),
              ),
            ),
          ]),
    );
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
        title: InkWell(
          onTap: () {
            _showDialog();
          },
          child: new Container(
            padding: new EdgeInsets.only(left: 50.0),
            child: Row(
              children: <Widget>[
                Text(
                  '今日维修',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  'images/mipmap-hdpi-v4/gteq_icon_popu_down.png',
                  height: 25.0,
                  width: 25.0,
                )
              ],
            ),
          ),
        ),
        bottom: new PreferredSize(
          child: Container(
            margin: new EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '总工时(小时)',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.9),
                      ),
                    ),
                    Container(
                      child: Text(
                        toalTime == null ? "0" : '$toalTime',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '工单总数',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.9),
                      ),
                    ),
                    Container(
                      child: Text(
                        dataAlready.length == 0 ? "0" : "${dataAlready.length}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(80.0),
        ),
      ),
      body: Container(
        child: new ListView.builder(
          itemCount: dataAlready.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //设备管理
                Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new RepairInformationPage(dataAlready[index]);
                  },
                ));
              },
              child: Container(
                margin: new EdgeInsets.only(
                    top: index == 0 ? 6.0 : 0.0,
                    bottom: index == dataAlready.length - 1 ? 20.0 : 0.0),
                child: Card(
                  elevation: 3.0,
                  child: Container(
                    color: Colors.white,
                    margin:
                        new EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
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
                            "" + dataAlready[index].equipmentNum,
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: new EdgeInsets.only(
                                  top: 5.0, left: 10.0, bottom: 5.0),
                              child: Text(
                                "维修人员: " + dataAlready[index].createByName,
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
                            "开始时间: " + dataAlready[index].createDate,
                            style: TextStyle(
                                color: Colors.black26,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: new EdgeInsets.only(
                                  top: 5.0, left: 10.0, bottom: 10.0),
                              child: Text(
                                "完成时间: " + dataAlready[index].endTime,
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0),
                              ),
                            ),
                            Container(
                                margin: new EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                    top: 4.0,
                                    bottom: 4.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "" + dataAlready[index].repairTime,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Text(' 小时')
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
