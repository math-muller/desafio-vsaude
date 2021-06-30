import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../global_components/global_components.dart';

import '../../../../routes/routes.dart';

import '../../home.dart';

class LoginController extends GetxController {
  final _repository = Get.find<AuthenticationRepository>();

  RxBool _isValidEmail = false.obs;
  bool get isValidEmail => _isValidEmail.value;

  String _email = '';
  String _password = '';

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController _emailController = TextEditingController();
  TextEditingController get editingController => _emailController;

  void onEmailChanged(String text) => _email = text;
  void onPasswordChanged(String text) => _password = text;

  String? validateEmail(String? text) {
    final _regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (text == null || text.isEmpty) {
      return 'Insira seu email';
    } else {
      if (_regex.hasMatch(text)) {
        _email = text;
        return null;
      } else {
        return 'Email inválido';
      }
    }
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return 'Insira sua senha';
    } else {
      _password = text;
      return null;
    }
  }

  Future<void> validateEmailError({required BuildContext context}) async {
    final bool _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      await authEmail(context: context);
    }
  }

  Future<void> validatePasswordError({required BuildContext context}) async {
    final bool _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      await auth(context: context);
    }
  }

  Future<void> authEmail({required BuildContext context}) async {
    SpinnerDialog spinnerDialog = SpinnerDialog(context);
    try {
      spinnerDialog.showLoading();
      final _isOk = await _repository.authEmail(email: _email);
      if (_isOk == 200) {
        _isValidEmail.value = true;
      } else {
        showMessage(context: context, message: 'Email não cadastrado');
      }
      spinnerDialog.hideLoading();
      _emailController.clear();
    } catch (e) {
      spinnerDialog.hideLoading();
      showMessage(context: context, message: 'Erro desconhecido');
      _emailController.clear();
    }
  }

  Future<void> auth({required BuildContext context}) async {
    SpinnerDialog spinnerDialog = SpinnerDialog(context);
    try {
      spinnerDialog.showLoading();
      await _repository.authEmailAndPassword(
        email: _email,
        password: _password,
      );
      spinnerDialog.hideLoading();
      HomeController.instance.setAuthentication();
    } catch (e) {
      if (e is DioError) {
        spinnerDialog.hideLoading();
        showMessage(context: context, message: 'Erro desconhecido');
      }
    }
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.REGISTER);
  }
}
