import 'package:flutter/material.dart';
import 'package:flutter_program/fragment_five/StaticList.dart';
import 'package:flutter_program/fragment_five/bean/UserListBean.dart';

class FragmentXunJianPagerItem1 extends StatefulWidget {
  @override
  _FragmentXunJianPagerItem1State createState() =>
      new _FragmentXunJianPagerItem1State();
}

class _FragmentXunJianPagerItem1State extends State<FragmentXunJianPagerItem1> {
  List<UserListBean> userData = new List();

  bool checked_values = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      print(StaticList.mdataUser[0].fullname == null
          ? ""
          : StaticList.mdataUser[0].fullname + '鸡儿');
      userData.addAll(StaticList.mdataUser);
      print(userData[0].fullname == null ? "" : userData[0].fullname + '鸡儿1');
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
          title: Text('维修人员'),
          bottom: PreferredSize(
              child: Container(
                height: 45.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Container(
                  margin: new EdgeInsets.only(
                      left: 6.0, right: 6.0, top: 6.0, bottom: 6.0),
                  padding: new EdgeInsets.only(left: 10.0),
                  height: 30.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(9.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.black26,
                      ),
                      Text(
                        '搜索',
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              preferredSize: Size.fromHeight(46.0)),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            new ListView.builder(
              itemCount: StaticList.mdataUser.length,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: <Widget>[
                    Container(
                      height: 41.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding:
                                new EdgeInsets.only(left: 20.0, right: 80.0),
                            child: Text(StaticList.mdataUser[index].fullname),
                          ),
                          Checkbox(
                            value: StaticList.mdataUser[index].isSelected,
                            onChanged: (values) {
                              setState(() {
                                print(values);
                                StaticList.mdataUser[index].isSelected = values;
                                //这里如果点击保存才会进行遍历添加让全局这个静态变化:StaticList.mdataUser[index].isSelected=values;
                              });
                            },
                            activeColor: Colors.green,
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
                );
              },
            ),
            new InkWell(
              onTap: () {
                _SavaDataToList();
              },
              child: Container(
                height: 35.0,
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(45, 46, 55, 22.0),
                child: Center(
                  child: Text(
                    "保存",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void _SavaDataToList() async{
    for(int index=0;index<StaticList.mdataUser.length;index++){
      if(StaticList.mdataUser[index].isSelected){
        print(StaticList.mdataUser[index].fullname);

      }
    }
    //设备管理
    Navigator.of(context).pop();
  }
}
