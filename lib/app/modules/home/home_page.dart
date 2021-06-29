import 'package:desafio_vsaude/app/modules/home/tabs/inicio/inicio_tab.dart';
import 'package:desafio_vsaude/app/modules/home/tabs/saude/saude_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desafio_vsaude/app/modules/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        bottomNavigationBar: Obx(() {
          _.tabIndex.value;
          return BottomNavigationBar(
            selectedItemColor: Colors.purple,
            currentIndex: _.tabIndex.value,
            onTap: _.changeTabIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time_sharp),
                label: 'Saúde',
                backgroundColor: Colors.white,
              ),
            ],
          );
        }),
        body: Obx(() {
          return IndexedStack(
            index: _.tabIndex.value,
            children: [
              InicioTab(),
              SaudeTab(),
            ],
          );
        }),
      ),
    );
  }
}
