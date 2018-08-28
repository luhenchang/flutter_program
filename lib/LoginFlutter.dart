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

/*void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginFlutter(),
    );
  }
}*/

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

  @override
  Widget build(BuildContext context) {
    var screnHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new Container(
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
                  margin:
                      new EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.important_devices,
                              size: 22.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: new EdgeInsets.only(right: 10.0),
                            ),
                            Expanded(
                              child: new TextField(
                                focusNode: FocusNode(),
                                cursorWidth: 1.5,
                                cursorColor: Colors.lightBlueAccent,
                                style: TextStyle(color: Colors.redAccent),
                                controller: _userServerController,
                                decoration: new InputDecoration(
                                    hintText: "请输入服务器地址",
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
                            Icon(
                              Icons.expand_more,
                              size: 24.0,
                              color: Colors.white,
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
                  margin:
                      new EdgeInsets.only(left: 30.0, right: 30.0, top: 1.0),
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.important_devices,
                              size: 22.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: new EdgeInsets.only(right: 10.0),
                            ),
                            Expanded(
                              child: new TextField(
                                cursorWidth: 1.5,
                                cursorColor: Colors.lightBlueAccent,
                                style: TextStyle(color: Colors.white),
                                controller: _userNameController,
                                decoration: new InputDecoration(
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                    hintText: "请输入用户名",
                                    focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w100)),
                              ),
                            ),
                            Padding(
                              padding: new EdgeInsets.only(right: 10.0),
                            ),
                            Icon(
                              Icons.expand_more,
                              size: 24.0,
                              color: Colors.white,
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
                  margin:
                      new EdgeInsets.only(left: 30.0, right: 30.0, top: 1.0),
                  child: new Column(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.important_devices,
                              size: 22.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: new EdgeInsets.only(right: 10.0),
                            ),
                            Expanded(
                              child: new TextField(
                                focusNode: FocusNode(),
                                cursorWidth: 1.5,
                                cursorColor: Colors.lightBlueAccent,
                                style: TextStyle(color: Colors.redAccent),
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
                            Icon(
                              Icons.expand_more,
                              size: 24.0,
                              color: Colors.white,
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
                margin: new EdgeInsets.only(left: 30.0, right: 30.0, top: 11.0),
                child: Material(
                  //带给我们Material的美丽风格美滋滋。你也多看看这个布局
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  elevation: 3.0,
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      LoginToMain(_userNameController.text,_userPassController.text,context);
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
                margin: new EdgeInsets.only(left: 30.0, right: 30.0, top: 11.0),
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
      ),
    );
  }

  void LoginToMain(String userName, String password, BuildContext context) async {
    print(userName);
    Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new HomePage();
      },
    ));
    Fluttertoast.showToast(
        msg: "  登录成功！ ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos:1,
        bgcolor: "#499292",
        textcolor: '#ffffff'
    );
    var url = 'http://118.25.173.88:8080/tpm/api/login';
    //向指定URL发送带参数的POST请求
    Map headerss={"password":"123456","username":"020504"};
    http.post(url ,body:'username=020504&password=123456').then((response) {
      print("响应状态： ${response.statusCode}");
      print("响应正文： ${response.body}");
    });

    var dio = new Dio();
    dio.options.baseUrl = "http://118.25.173.88:8080/tpm/api/";
    //data: {"password": "123456", "username": "020504"},
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;
    dio.options.contentType=ContentType("text/html","POST");
    try {
      var response = await dio.post(
        "/login",
        data: {"password":password, "username":userName},
      );
      print("haha" + response.data.toString());
      List<String> mlistheader = response.headers.toString().split(":");
      print("enen=" + mlistheader[2].toString().split(";")[0].split("=")[1]);
      Map userMap = json.decode(response.data.toString());
      print(userMap[0]);


     // LoginBean loginBean = new LoginBean.fromJson(userMap);
    //  print('Howdy, ${loginBean.msg}!');
      if(userMap[0]=="success"){
        Navigator.of(context).push(new PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return new HomePage();
          },
        ));
        Fluttertoast.showToast(
            msg: "  登录成功！ ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos:1,
            bgcolor: "#499292",
            textcolor: '#ffffff'
        );
      }
    //  print("hehe" + loginBean.msg);
    } catch (e) {
      print(e.toString());
    }
  }
}
