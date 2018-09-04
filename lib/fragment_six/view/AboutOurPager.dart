import 'package:flutter/material.dart';

class AboutOurPager extends StatefulWidget {
  String title;

  AboutOurPager(var title) {
    this.title = title;
  }

  @override
  _AboutOurPagerState createState() => new _AboutOurPagerState(title);
}

class _AboutOurPagerState extends State<AboutOurPager> {
  String title;

  _AboutOurPagerState(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    var screnHeight = MediaQuery.of(context).size.height;
    var screnWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },//故障申请表
          child: Icon(
            Icons.chevron_left,
            size: 29.0,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "关于我们",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
      body: Container(
        color: Color(0xFFEEEEEE),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: new EdgeInsets.only(top: 30.0),
              child: Image.asset(
                "images/ic_launcher.png",
                width: 56.0,
                height: 56.0,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: new EdgeInsets.only(top: 15.0),
              child: Text(
                "微感设备管理系统",
                style: TextStyle(
                    letterSpacing: 0.5,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: new EdgeInsets.only(top: 8.0, bottom: 18.9),
              child: Text(
                "(WG-ST-1.0)",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Text("客服QQ"),
                    padding: new EdgeInsets.only(
                        left: 12.0, top: 15.0, bottom: 15.0),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                      left: 10.0,
                    ),
                    color: Colors.black26,
                    height: 0.8,
                    width: screnWidth - 20.0,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Text("维修技术支持"),
                    padding: new EdgeInsets.only(
                        left: 12.0, top: 15.0, bottom: 15.0),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                      left: 10.0,
                    ),
                    color: Colors.black26,
                    height: 0.8,
                    width: screnWidth - 20.0,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Text("技术支持邮箱"),
                    padding: new EdgeInsets.only(
                        left: 12.0, top: 15.0, bottom: 15.0),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                      left: 10.0,
                    ),
                    color: Colors.black26,
                    height: 0.8,
                    width: screnWidth - 20.0,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Text("客服电话"),
                    padding: new EdgeInsets.only(
                        left: 12.0, top: 15.0, bottom: 15.0),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                      left: 10.0,
                    ),
                    color: Colors.black26,
                    height: 0.8,
                    width: screnWidth - 20.0,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    child: Text("公司官网"),
                    padding: new EdgeInsets.only(
                        left: 12.0, top: 15.0, bottom: 15.0),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                      left: 10.0,
                    ),
                    color: Colors.black26,
                    height: 0.8,
                    width: screnWidth - 20.0,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screnHeight / 4),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: <Widget>[
                  Text(
                    '微感科技版权所有',
                    style: TextStyle(color: Colors.black38, fontSize: 12.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'copyright@2017-2018',
                      style: TextStyle(color: Colors.black38, fontSize: 9.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
