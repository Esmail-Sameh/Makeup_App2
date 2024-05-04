import 'dart:convert';

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

  late bool isLoding = true;

  void changeNavBar(int index) {
    currentIndex = index;
    update();
  }


  List<HomeModel> dataList=[];

  void getHomeData() async {
    try{
      isLoding = true;
      var product = await RemoteServices.getDataList();
      if(product != null){
        dataList = product;
        print(product.length);
      }
    }finally{
      isLoding = false;
    };
    update();

  }
}
