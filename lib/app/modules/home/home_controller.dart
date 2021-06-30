import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();

  RxInt _tabIndex = 0.obs;
  RxBool _isAuthenticated = false.obs;

  int get tabIndex => _tabIndex.value;
  bool get isAuthenticated => _isAuthenticated.value;

  void changeTabIndex(int index) {
    _tabIndex.value = index;
  }

  void setAuthentication() {
    _isAuthenticated.value = !_isAuthenticated.value;
  }
}
