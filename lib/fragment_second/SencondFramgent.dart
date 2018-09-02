import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_second/bean/SecondBean.dart';

class SencondFragment extends StatefulWidget {
  String title;

  SencondFragment(var title) {
    this.title = title;
  }

  @override
  _SencondFragmentState createState() => new _SencondFragmentState(title);
}

class _SencondFragmentState extends State<SencondFragment> {
  String title;
  List<SecondBean> mdata = new List();

  _SencondFragmentState(String title) {
    this.title = title;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() async {
    setState(() {
      SecondBean secondBean1 = new SecondBean(
          "0",
          Image.asset(
            "images/mipmap-xhdpi-v4/gteq_icon_main_myorder.png",
            height: 20.0,
            width: 20.0,
          ),
          "暂停中工单");
      mdata.add(secondBean1);
      SecondBean secondBean2 = new SecondBean(
          "0",
          Image.asset(
            "images/mipmap-xhdpi-v4/gteq_icon_main_uncheck.png",
            height: 20.0,
            width: 20.0,
          ),
          "待审核工单");
      mdata.add(secondBean2);
      SecondBean secondBean3 = new SecondBean(
          "5",
          Image.asset(
            "images/mipmap-xhdpi-v4/gteq_icon_main_unbegin.png",
            height: 20.0,
            width: 20.0,
          ),
          "待分配工单");
      mdata.add(secondBean3);
      SecondBean secondBean4 = new SecondBean(
          "0",
          Image.asset(
            "images/mipmap-xhdpi-v4/gteq_icon_main_myeqbug.png",
            height: 20.0,
            width: 20.0,
          ),
          "待接收工单");
      mdata.add(secondBean4);
      SecondBean secondBean5 = new SecondBean(
          "1",
          Image.asset(
            "images/mipmap-xhdpi-v4/gteq_icon_main_doing.png",
            height: 20.0,
            width: 20.0,
          ),
          "执行中工单");
      mdata.add(secondBean5);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screen_width = MediaQuery
        .of(context)
        .size
        .width;
    var screen_height = MediaQuery
        .of(context)
        .size
        .height;

    return new Scaffold(
      body: Container(
        color: Color(0xFFEEEEEE),
        child: ListView.builder(
            itemCount: mdata.length,
            itemBuilder: (BuildContext content, int index) {
              return Container(
                color: Colors.white,
                alignment: Alignment.center,
                height: 80.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              padding:
                              new EdgeInsets.only(left: 10.0, right: 15.0),
                              alignment: Alignment.center,
                              height: 76.0,
                              child: mdata[index].image,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 58.0,
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: new EdgeInsets.only(top: 5.0),
                                   child:Text(
                                      mdata[index].title,
                                      style: TextStyle(fontSize: 16.0),
                                    ),),
                                  Container(
                                    padding: new EdgeInsets.only(top: 12.0),
                                    child: Text(
                                      mdata[index].count + "条",
                                      style: TextStyle(
                                          fontSize: 13.0, color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: new EdgeInsets.only(right: 13.0),
                          child: Image.asset(
                            "images/mipmap-xhdpi-v4/gteq_icon_main_go.png",
                            height: 15.0,
                            width: 18.0,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 4.0,
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
