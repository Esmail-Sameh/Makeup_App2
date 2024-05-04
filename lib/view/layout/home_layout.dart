import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_app/controller/services/controller.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: controller.screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            items:[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: 'Category',
              ),
            ],
            onTap: (index) {
              controller.changeNavBar(index);
            },
          ),
        );
      },
    );
  }
}
