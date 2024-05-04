import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_app/controller/services/controller.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: ConditionalBuilder(
              condition: controller.isLoding ,
              builder: (context) => Center(child: CircularProgressIndicator()),
              fallback: (context) => Center(child: Text('get data done'),),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            // print(controller.dataList[]);
          }),
        );
      },
    );
  }
}
