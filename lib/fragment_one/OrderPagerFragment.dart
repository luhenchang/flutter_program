import 'package:flutter/material.dart';

class OrderPagerFragment extends StatefulWidget {
  String title;

  OrderPagerFragment(var title) {
    this.title = title;
  }

  @override
  _OrderPagerFragmetnState createState() => new _OrderPagerFragmetnState(title);
}

class _OrderPagerFragmetnState extends State<OrderPagerFragment> {
  String title;
  List<String>mdata=new List();
  _OrderPagerFragmetnState(String title) {
    this.title = title;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  _loadData()async{
    setState(() {
      mdata.add('保修/维修 统计');
      mdata.add('工作量统计');
      mdata.add('备件领用统计');
      mdata.add('包养统计');
      mdata.add('巡检统计');
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color:Color(0xFFEEEEEE),
        child: ListView.builder(
            itemCount:mdata.length,
            itemBuilder: (BuildContext content, int index) {
              return Container(
                color:Colors.white,
                alignment: Alignment.center,
                height:60.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: new EdgeInsets.only(left: 20.0),
                          alignment: Alignment.center,
                          height:56.0,
                          child: Text(
                            mdata[index],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.only(right:13.0),
                          child: Image.asset(
                            "images/mipmap-xhdpi-v4/gteq_icon_main_go.png",
                            height: 16.0,
                            width: 18.0,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height:4.0,
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
