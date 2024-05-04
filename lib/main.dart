import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makeup_app/controller/services/services.dart';
import 'package:makeup_app/test.dart';

import 'package:makeup_app/view/layout/home_layout.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: HomeLayout(),
    );
  }
}
