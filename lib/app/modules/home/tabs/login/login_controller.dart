import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:desafio_vsaude/app/data/repositories/authentication/authentication_repository.dart';
import 'package:desafio_vsaude/app/global_components/show_message.dart';
import 'package:desafio_vsaude/app/modules/home/home.dart';
import 'package:desafio_vsaude/app/routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _repository = Get.find<AuthenticationRepository>();

  TokenAuthModel? _authModel;

  RxBool _isValidEmail = false.obs;
  bool get isValidEmail => _isValidEmail.value;

  String _email = '';
  String _password = '';

  TextEditingController _emailController = TextEditingController();
  TextEditingController get editingController => _emailController;

  void onEmailChanged(String text) => _email = text;
  void onPasswordChanged(String text) => _password = text;

  Future<void> authEmail({required BuildContext context}) async {
    try {
      final _isOk = await _repository.authEmail(email: _email);
      if (_isOk == 200) {
        _isValidEmail.value = true;
      } else {
        showMessage(context: context, message: 'Email não cadastrado');
      }
      _emailController.clear();
    } catch (e) {
      showMessage(context: context, message: 'Erro desconhecido');
      _emailController.clear();
    }
  }

  Future<void> auth({required BuildContext context}) async {
    try {
      _authModel = await _repository.authEmailAndPassword(
        email: _email,
        password: _password,
      );
      HomeController.instance.setAuthentication();
    } catch (e) {
      if (e is DioError) {
        showMessage(context: context, message: 'Erro desconhecido');
      }
    }
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.REGISTER);
  }
}
