import 'package:desafio_vsaude/app/modules/home/home.dart';
import 'package:desafio_vsaude/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/routes.dart';

void main() {
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
