import 'package:flutter/cupertino.dart';

class ThreadBean{
   var title;
   var subjects;
   var image_url;
   ThreadBean(var subjects,var title,var image_url){
     this.subjects=subjects;
     this.title=title;
     this.image_url=image_url;
   }
}