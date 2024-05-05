import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_app/controller/end_point.dart';
import 'package:makeup_app/controller/services/services.dart';
import 'package:makeup_app/model/home_model.dart';
import 'package:makeup_app/view/screens/category_screen.dart';
import 'package:makeup_app/view/screens/home_screen.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getHomeData();
    print('on Init');
    super.onInit();
  }

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
  ];
  bool isloding = true;
  int currentIndex = 0;
  IconData addToCartIcon = Icons.add;
  bool inCart = false;
  late bool isLoding = true;

  void changeNavBar(int index) {
    currentIndex = index;
    update();
  }

  List<HomeModel> dataList=[];
 Future<List<HomeModel>?> getHomeData()async{
   isLoding = true;
    await RemoteServices.getData().then((value){
      print('Done');
      dataList = value!;
    }).catchError((error){
      print(error.toString());
    });
   isLoding =false;
    update();
    return null;
 }

 void addToCartFunction(){

   inCart ? addToCartIcon = Icons.add : addToCartIcon = Icons.done;
   update();
 }

 bool isCard(int id){
   if(dataList.any((product)=> product.id == id)){
  return true;
   }
   update();
   return false;

 }




























}
