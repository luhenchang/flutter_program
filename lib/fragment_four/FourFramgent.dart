import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_four/bean/FourBean.dart';
import 'package:flutter_program/fragment_four/view/FourPagerItem.dart';

class FourFramgent extends StatefulWidget {
  String title;

  FourFramgent(var title) {
    this.title = title;
  }

  @override
  _FourFramgentState createState() => new _FourFramgentState(title);
}

class _FourFramgentState extends State<FourFramgent> {
  String title;
  List<FourBean> mdata = new List();

  _FourFramgentState(String title) {
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
      FourBean FourBean1=new FourBean("总共203台设备","设备列表","images/mipmap-xhdpi-v4/gteq_icon_main_eqlist.png");
      mdata.add(FourBean1);
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
                height:60.0,
                child: Column(
                  children: <Widget>[
                    FourPagerItem(mdata[index].image_url,mdata[index].title,mdata[index].subjects),
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
