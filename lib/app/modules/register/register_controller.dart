import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:desafio_vsaude/app/data/repositories/add_account/add_account_repository.dart';
import 'package:desafio_vsaude/app/global_components/show_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _repository = Get.find<AddAccountRepository>();

  TokenAuthModel? _authModel;
  TokenAuthModel? get authModel => _authModel;

  String _fullName = '';
  String _email = '';
  String _password = '';

  void onFullNameChanged(String text) => _fullName = text;
  void onEmailChanged(String text) => _email = text;
  void onPasswordChanged(String text) => _password = text;

  Future<void> signUp({required BuildContext context}) async {
    try {
      await _repository.addAccount(
        name: _fullName,
        email: _email,
        password: _password,
      );
      showMessage(
        context: context,
        message: 'Cadastrado com sucesso',
        success: true,
      );
    } catch (e) {
      print(e);
      showMessage(context: context, message: 'Erro ao cadastrar usuario.');
    }
  }

  void goBack() {
    Get.back();
  }
}
