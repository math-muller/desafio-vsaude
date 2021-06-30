import 'package:desafio_vsaude/app/routes/routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isValidEmail = false.obs;

  void goToRegister() {
    Get.toNamed(AppRoutes.REGISTER);
  }
}
