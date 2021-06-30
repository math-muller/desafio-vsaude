import 'package:desafio_vsaude/app/data/repositories/authentication/authentication_repository.dart';
import 'package:desafio_vsaude/app/global_components/error_message.dart';
import 'package:desafio_vsaude/app/modules/home/home.dart';
import 'package:desafio_vsaude/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _repository = Get.find<AuthenticationRepository>();

  RxBool isValidEmail = false.obs;

  String _email = '';
  String _password = '';

  void onEmailChanged(String text) => _email = text;
  void onPasswordChanged(String text) => _password = text;

  void goToRegister() {
    Get.toNamed(AppRoutes.REGISTER);
  }

  Future<void> authEmail({required BuildContext context}) async {
    try {
      final _isOk = await _repository.authEmail(email: _email);
      if (_isOk == 200) {
        isValidEmail.value = true;
      } else {
        showErrorMessage(context, 'Email não cadastrado');
      }
    } catch (e) {}
  }

  Future<void> auth({required BuildContext context}) async {
    try {
      _repository.authEmailAndPassword(email: _email, password: _password);
      HomeController.instance.setAuthentication();
    } catch (e) {
      showErrorMessage(context, 'Erro desconhecido');
    }
  }
}
