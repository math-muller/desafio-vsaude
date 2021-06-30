import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tabs/inicio/inicio_tab.dart';
import 'tabs/login/login_tab.dart';
import 'tabs/saude/saude_tab.dart';

import 'home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        bottomNavigationBar: Obx(() {
          _.tabIndex;
          return BottomNavigationBar(
            selectedItemColor: Colors.purple,
            currentIndex: _.tabIndex,
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
            index: _.tabIndex,
            children: [
              InicioTab(),
              _.isAuthenticated ? SaudeTab() : LoginTab(),
            ],
          );
        }),
      ),
    );
  }
}
