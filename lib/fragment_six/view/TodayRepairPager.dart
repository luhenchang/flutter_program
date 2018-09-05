import 'package:flutter/material.dart';

class TodayRepairPager extends StatefulWidget {
  @override
  _TodayRepairPagerState createState() => new _TodayRepairPagerState();
}

class _TodayRepairPagerState extends State<TodayRepairPager> {
  GlobalKey _myKey = new GlobalKey();

  _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
          key: _myKey,
          content: new Container(
              margin: new EdgeInsets.only(top:10.0),
              alignment: Alignment.center,
              height: 240.0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:CrossAxisAlignment.stretch,
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
                    margin: new EdgeInsets.only(bottom:21.0),
                    child: Text(
                      '本月维修',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.9),
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(bottom:21.0),
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
                        '0',
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
                        '0',
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
      body: Container(),
    );
  }
}
