import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_app/controller/services/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return ConditionalBuilder(
          condition: controller.isLoding,
          builder: (context) => Center(child: CircularProgressIndicator()),
          fallback: (context) {
            return SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.favorite)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.lock)),
                      ],
                    ),
                  ),
                  Text(
                    'Products',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.42,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      physics: BouncingScrollPhysics(),
                      children:
                          List.generate(controller.dataList.length, (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Stack(alignment: Alignment.bottomLeft, children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height / 5.2,
                                  //color: Colors.grey,
                                  child: Image.network(
                                    '${controller.dataList[index].imageLink}',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                if (controller.dataList[index].priceSign !=
                                    null)
                                  Container(
                                    width: 35,
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'New',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                              ]),
                              // SizedBox(height: 10,),
                              Text(
                                '${controller.dataList[index].name}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                '${controller.dataList[index].description}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ));
          },
        );
      },
    );
  }
}
