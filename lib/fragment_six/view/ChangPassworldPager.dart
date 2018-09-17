import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangPassworldPager extends StatefulWidget {
  @override
  _ChangPassworldPagerState createState() => new _ChangPassworldPagerState();
}

class _ChangPassworldPagerState extends State<ChangPassworldPager> {
  var _userServerController = new TextEditingController();
  var _userPassController = new TextEditingController();
  var _userPassController2 = new TextEditingController();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String local_userNames;

  @override
  void initState() {
    super.initState();
    _query();
  }

  //这里刚进入时候来获取是不是有本地服务和用户名

  _query() async {
    SharedPreferences prefs = await _prefs;
    setState(() {
      local_userNames = prefs.getString("lcusername");
    });
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
        backgroundColor: Colors.blue,
        title: Text(
          '修改密码',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 44.0,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                    child: Text("用户名"),
                  ),
                  Text(local_userNames == null ? "" : local_userNames),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black26,
              height: 1.0,
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              height: 44.0,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                    child: Text("原密码"),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 200.0,
                    child: new TextField(
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      cursorWidth: 1.5,
                      cursorColor: Colors.lightBlueAccent,
                      style: TextStyle(color: Colors.black38),
                      controller: _userServerController,
                      decoration: new InputDecoration(
                          hintText: "请输入原密码",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black26,
              height: 1.0,
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              height: 44.0,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: new EdgeInsets.only(left: 20.0, right: 80.0),
                    child: Text("新密码"),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 200.0,
                    child: new TextField(
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      cursorWidth: 1.5,
                      cursorColor: Colors.lightBlueAccent,
                      style: TextStyle(color: Colors.black38),
                      controller: _userPassController,
                      decoration: new InputDecoration(
                          hintText: "请输入原密码",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black26,
              height: 1.0,
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              height: 44.0,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: new EdgeInsets.only(left: 20.0, right: 67.0),
                    child: Text("确认密码"),
                  ),
                  SizedBox(
                    height: 40.0,
                    width: 200.0,
                    child: new TextField(
                      keyboardType: TextInputType.text,
                      focusNode: FocusNode(),
                      cursorWidth: 1.5,
                      cursorColor: Colors.lightBlueAccent,
                      style: TextStyle(color: Colors.black38),
                      controller: _userPassController2,
                      decoration: new InputDecoration(
                          hintText: "请再次输入新密码",
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black26,
              height: 1.0,
            )
          ],
        ),
        Material(
          elevation:3.0,
          child: RaisedButton(
            padding: new EdgeInsets.all(0.0),
            splashColor: Colors.red,
            onPressed: () {
              if (_userServerController.text == "" ||
                  _userPassController.text == "" ||
                  _userPassController2.text == "") {
                Fluttertoast.showToast(
                    msg: "  请将信息填写完整！ ",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIos: 1,
                    bgcolor: "#FF5A5D",
                    textcolor: '#ffffff');
              } else {
                if (_userPassController.text == _userPassController2.text) {
                  _RePairPassworld(_userServerController.text,
                      _userPassController.text, _userPassController2.text);
                } else {
                  Fluttertoast.showToast(
                      msg: "  两次密码不一致！ ",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      bgcolor: "#FF5A5D",
                      textcolor: '#ffffff');
                }
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: Text(
                '确定',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  /*
  * POST http://118.25.173.88:8080/tpm/sys/user/password HTTP/1.1
Accept-Language: zh-CN,zh;q=0.8
User-Agent: Mozilla/5.0 (Linux; U; Android 8.0.0; zh-cn; SM-G9500 Build/R16NW) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30
Content-Type: application/x-www-form-urlencoded
Content-Length: 34
Host: 118.25.173.88:8080
Connection: Keep-Alive
Accept-Encoding: gzip
Cookie: JSESSIONID=6f321b8b-2f79-42a3-847c-55fa229f91e1; rememberMe=deleteMe

password=123456&newPassword=666666
  *
  * */
  void _RePairPassworld(String text, String text2, String text3) async {
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
    FormData formData =
        new FormData.from({"password": text, "newPassword": text3});
    var response = await dio.post("/tpm/sys/user/password", data: formData);
    print("haha=" + response.data.toString());
    int count = response.data['code'];
    if (response.data['msg'] == "success") {
      Fluttertoast.showToast(
          msg: "  修改成功！ ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          bgcolor: "#FF5A5D",
          textcolor: '#ffffff');
    } else {
      Fluttertoast.showToast(
          msg: response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          bgcolor: "#FF5A5D",
          textcolor: '#ffffff');
    }
  }
}
