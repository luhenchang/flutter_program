import 'package:flutter/material.dart';

class FivePagerItem extends StatefulWidget {
  final String image_url;
  final String title;
  final String subjects;

  FivePagerItem(this.image_url, this.title, this.subjects);

  @override
  _FivePagerItemState createState() =>
      new _FivePagerItemState(image_url, title, subjects);
}

class _FivePagerItemState extends State<FivePagerItem> {
  String image_url;
  String title;
  String subjects;

  _FivePagerItemState(this.image_url, this.title, this.subjects);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: new EdgeInsets.only(left: 10.0, right: 7.0),
        height: 56.0,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: new Row(
                children: <Widget>[
                  Image.asset(
                    image_url,
                    width: 20.0,
                    height: 20.0,
                  ),
                  Container(
                    padding: new EdgeInsets.only(left: 10.0),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: new Row(
                children: <Widget>[
                  Text(subjects,style: TextStyle(color:Colors.grey),),
                  Image.asset(
                    "images/mipmap-xhdpi-v4/gteq_icon_main_go.png",
                    height: 15.0,
                    width: 18.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
