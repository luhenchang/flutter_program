import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_program/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_program/LoginBean.dart';
import 'package:flutter_program/ShowMainFlutter.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFlutterState();
  }
}

class _LoginFlutterState extends State<LoginFlutter> {
  var _userServerController = new TextEditingController();
  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();
  var local_server;
  var local_userName;
  bool isNulls = true;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _query();
  }

  //这里刚进入时候来获取是不是有本地服务和用户名

  _query() async {
    SharedPreferences prefs = await _prefs;
    setState(() {
      String local_servers = prefs.getString("lcserver");
      String local_userNames = prefs.getString("lcusername");
      if (local_servers == null || local_userNames == null) {
        isNulls = true;
      } else {
        local_server = local_servers;
        local_userName = local_userNames;
        _userServerController.text = local_server;
        _userNameController.text = local_userName;
        isNulls = false;
      }
    });
  }

  _add(var servers, var username,String coockies) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      print('1='+coockies);
      prefs.setString('Cookie',"JSESSIONID="+coockies);
      prefs.setString("lcserver", servers);
      prefs.setString("lcusername", username);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screnHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new Stack(
          alignment:Alignment.center,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/login_bg.jpg"),
              )),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: new EdgeInsets.only(top: screnHeight / 5),
                    child: Image.asset(
                      "images/ic_launcher.png",
                      width: 56.0,
                      height: 56.0,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: new EdgeInsets.only(top: 10.0),
                    child: Text(
                      "微感设备管理系统",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  Container(
                      height: 50.0,
                      margin: new EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 20.0),
                      child: new Column(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'images/mipmap-xhdpi-v4/gteq_login_icon_ser.png',
                                  height: 18.0,
                                  width: 18.0,
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(right: 10.0),
                                ),
                                Expanded(
                                  child: new TextField(
                                    keyboardType: TextInputType.text,
                                    focusNode: FocusNode(),
                                    cursorWidth: 1.5,
                                    cursorColor: Colors.lightBlueAccent,
                                    style: TextStyle(color: Colors.white),
                                    controller: _userServerController,
                                    decoration: new InputDecoration(
                                        hintText:
                                            isNulls ? "请输入服务器地址" : local_server,
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: isNulls
                                                ? Colors.white70
                                                : Colors.white)),
                                  ),
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(right: 10.0),
                                ),
                                Image.asset(
                                  'images/mipmap-xhdpi-v4/gteq_login_down.png',
                                  height: 16.0,
                                  width: 16.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: new EdgeInsets.only(top: 3.0),
                            height: 1.0,
                            color: Colors.white30,
                          ),
                        ],
                      )),
                  Container(
                      height: 50.0,
                      margin: new EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 1.0),
                      child: new Column(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'images/mipmap-xhdpi-v4/gteq_login_icon_username.png',
                                  height: 18.0,
                                  width: 18.0,
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(right: 10.0),
                                ),
                                Expanded(
                                  child: new TextField(
                                    keyboardType: TextInputType.text,
                                    cursorWidth: 1.5,
                                    cursorColor: Colors.lightBlueAccent,
                                    style: TextStyle(color: Colors.white),
                                    controller: _userNameController,
                                    decoration: new InputDecoration(
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                        hintText:
                                            isNulls ? "请输入用户名" : local_userName,
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight
                                                .w100)), //FontWeight.w400
                                  ),
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(right: 10.0),
                                ),
                                Image.asset(
                                  'images/mipmap-xhdpi-v4/gteq_login_down.png',
                                  height: 16.0,
                                  width: 16.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: new EdgeInsets.only(top: 3.0),
                            height: 1.0,
                            color: Colors.white30,
                          ),
                        ],
                      )),
                  Container(
                      height: 50.0,
                      margin: new EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 1.0),
                      child: new Column(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'images/mipmap-xhdpi-v4/gteq_login_icon_pwd.png',
                                  height: 18.0,
                                  width: 18.0,
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(right: 10.0),
                                ),
                                Expanded(
                                  child: new TextField(
                                    focusNode: FocusNode(),
                                    cursorWidth: 1.5,
                                    cursorColor: Colors.lightBlueAccent,
                                    style: TextStyle(color: Colors.white),
                                    controller: _userPassController,
                                    keyboardType: TextInputType.text,
                                    decoration: new InputDecoration(
                                        hintText: "请输入密码",
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                        hintStyle:
                                            TextStyle(color: Colors.white70)),
                                    obscureText: true,
                                  ),
                                ),
                                Padding(
                                  padding: new EdgeInsets.only(right: 10.0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: new EdgeInsets.only(top: 3.0),
                            height: 1.0,
                            color: Colors.white30,
                          ),
                        ],
                      )),
                  Container(
                    margin:
                        new EdgeInsets.only(left: 30.0, right: 30.0, top: 11.0),
                    child: Material(
                      //带给我们Material的美丽风格美滋滋。你也多看看这个布局
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      elevation: 3.0,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (_userServerController.text.isEmpty ||
                              _userNameController.text.isEmpty ||
                              _userPassController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "  请将信息填写完整！ ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIos: 1,
                                bgcolor: "#FF5A5D",
                                textcolor: '#ffffff');
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            LoginToMain(
                                _userServerController.text.trim(),
                                _userNameController.text.trim(),
                                _userPassController.text.trim(),
                                context);
                          }
                        },
                        //来个飞溅美滋滋。
                        splashColor: Colors.lightBlueAccent,
                        child: Ink(
                          height: 46.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            colors: <Color>[
                              Colors.lightBlueAccent,
                              Colors.lightBlue
                            ],
                          )),
                          child: Center(
                            child: Text(
                              '登录',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        new EdgeInsets.only(left: 30.0, right: 30.0, top: 11.0),
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        const Radius.circular(6.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "离线登录",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                    width: 200.0,
                  )
                ],
              ),
            ),
            SpinKitCubeGrid(
              color: Colors.lightBlueAccent,
              size:isLoading?80.0:0.0,
            ),
          ],
        ),
      ),
    );
  }

  void LoginToMain(String localservers, String userName, String password,
      BuildContext context) async {
    CircularProgressIndicator(
      backgroundColor: Colors.red,
    );
    var dio = new Dio();
    dio.options.baseUrl = localservers; //"http://118.25.173.88:8080";
    //data: {"password": "123456", "username": "020504"},
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;
    FormData formData =
        new FormData.from({"username": userName, "password": password});
    try {
      var response = await dio.post(
        "/tpm/api/login",
        data: formData,
      );
      print("haha" + response.data.toString());
      List<String> mlistheader = response.headers.toString().split(":");
      print("enen=" + mlistheader[2].toString().split(";")[0].split("=")[1]);

      print("userMap[0]=" + response.data["msg"]);
      /*var user=new LoginBean.fromJson(userMap);

      print("emain"+user.data.email);*/

      // LoginBean loginBean = new LoginBean.fromJson(userMap);
      //  print('Howdy, ${loginBean.msg}!');
      if (response.data["msg"] == "success") {
        _add(localservers, userName,mlistheader[2].toString().split(";")[0].split("=")[1].toString());
        Navigator.of(context).push(new PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return new HomePage();
          },
        ));
        //SpinKitCubeGrid(color:Colors.blue,size:80.0,);
        Fluttertoast.showToast(
            msg: "  登录成功！ ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            bgcolor: '#2CB044',
            textcolor: '#ffffff');
        isLoading=false;
      } else {
        Fluttertoast.showToast(
            msg: "  登录失败！ ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            bgcolor: "#FF5A5D",
            textcolor: '#ffffff');
        setState(() {
          isLoading=false;

        });

      }
      //  print("hehe" + loginBean.msg);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "  登录失败！ ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          bgcolor: "#FF5A5D",
          textcolor: '#ffffff');
      setState(() {
        isLoading=false;

      });

      //print("erro:" + e.toString());
    }
  }
}
