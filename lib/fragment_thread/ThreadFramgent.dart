import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_second/bean/SecondBean.dart';
import 'package:flutter_program/fragment_thread/bean/ThreadBean.dart';
import 'package:flutter_program/fragment_thread/view/ThreadPagerItem.dart';

class ThreadFramgent extends StatefulWidget {
  String title;

  ThreadFramgent(var title) {
    this.title = title;
  }

  @override
  _ThreadFramgentState createState() => new _ThreadFramgentState(title);
}

class _ThreadFramgentState extends State<ThreadFramgent> {
  String title;
  List<ThreadBean> mdata = new List();

  _ThreadFramgentState(String title) {
    this.title = title;
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    setState(() {
      /*images/mipmap-xhdpi-v4/gteq_icon_main_eqlist
images/mipmap-xhdpi-v4/gteq_icon_main_pj
images/mipmap-xhdpi-v4/gteq_icon_main_repair
images/mipmap-xhdpi-v4/gteq_icon_main_appoint
images/mipmap-xhdpi-v4/gteq_icon_main_repairlist
images/mipmap-xhdpi-v4/gteq_icon_main_doing
images/mipmap-xhdpi-v4/gteq_icon_main_addrepairrecord*/
      ThreadBean threadBean1=new ThreadBean("总共197台","设备列表","images/mipmap-xhdpi-v4/gteq_icon_main_eqlist.png");
      mdata.add(threadBean1);
      ThreadBean threadBean2=new ThreadBean("添加","添加设备","images/mipmap-xhdpi-v4/gteq_icon_main_pj.png");
      mdata.add(threadBean2);
      ThreadBean threadBean3=new ThreadBean("保修","故障报修","images/mipmap-xhdpi-v4/gteq_icon_main_repair.png");
      mdata.add(threadBean3);
      ThreadBean threadBean4=new ThreadBean("派工","维修派工","images/mipmap-xhdpi-v4/gteq_icon_main_appoint.png");
      mdata.add(threadBean4);
      ThreadBean threadBean5=new ThreadBean("维修","维修单","images/mipmap-xhdpi-v4/gteq_icon_main_repairlist.png");
      mdata.add(threadBean5);
      ThreadBean threadBean6=new ThreadBean("验证","维修验证","images/mipmap-xhdpi-v4/gteq_icon_main_doing.png");
      mdata.add(threadBean6);
      ThreadBean threadBean7=new ThreadBean("添加","设备列表","images/mipmap-xhdpi-v4/gteq_icon_main_addrepairrecord.png");
      mdata.add(threadBean7);
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
                    ThreadPagerItem(mdata[index].image_url,mdata[index].title,mdata[index].subjects),
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
