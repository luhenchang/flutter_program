import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_five/bean/FiveBean.dart';
import 'package:flutter_program/fragment_five/view/FivePagerItem.dart';

class FiveFramgent extends StatefulWidget {
  String title;

  FiveFramgent(var title) {
    this.title = title;
  }

  @override
  _FiveFramgentState createState() => new _FiveFramgentState(title);
}

class _FiveFramgentState extends State<FiveFramgent> {
  String title;
  List<FiveBean> mdata = new List();

  _FiveFramgentState(String title) {
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
      FiveBean FiveBean1=new FiveBean("5","巡检工单","images/mipmap-xhdpi-v4/gteq_icon_main_inspect.png");
      mdata.add(FiveBean1);
      FiveBean FiveBean2=new FiveBean("3","保养工单","images/mipmap-xhdpi-v4/gteq_icon_main_upkeep.png");
      mdata.add(FiveBean2);
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
                    FivePagerItem(mdata[index].image_url,mdata[index].title,mdata[index].subjects),
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
