import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt tabIndex = 0.obs;
  RxBool isAuthenticated = false.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
