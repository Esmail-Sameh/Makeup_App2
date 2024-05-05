//
// import 'dart:convert';
// import 'package:makeup_app/controller/end_point.dart';
// import 'package:makeup_app/model/home_model.dart';
// import 'package:http/http.dart' as http;
//
// class RemoteServices{
//
//
//   static Future<List<HomeModel>?> getDataList() async{
//     var uri = Uri.parse(HOME);
//     var json = await http.get(uri);
//     if(json.statusCode == 200){
//       var body =  json.body;
//       return homeModelFromJson(body);
//
//     }else{
//       return null;
//     }
//
//   }
//
// }


import 'package:flutter/cupertino.dart';
import 'package:makeup_app/model/home_model.dart';

import '../end_point.dart';
import 'package:http/http.dart' as http;
class RemoteServices {

  static Future<List<HomeModel>?> getData()async{
    var url = Uri.parse(HOME);
    var json = await http.get(url);
    if(json.statusCode ==200){
      var body = json.body;
      return homeModelFromJson(body);
    }
    return null;

  }

}

















