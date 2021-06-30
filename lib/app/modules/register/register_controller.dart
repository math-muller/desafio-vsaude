import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:desafio_vsaude/app/data/repositories/add_account/add_account_repository.dart';
import 'package:desafio_vsaude/app/global_components/show_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _repository = Get.find<AddAccountRepository>();

  TokenAuthModel? _authModel;
  TokenAuthModel? get authModel => _authModel;

  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> get formKey => _formKey;

  String _fullName = '';
  String _email = '';
  String _password = '';

  String? validateFullName(String? text) {
    if (text == null || text.isEmpty) {
      return 'Insira seu nome';
    } else {
      _fullName = text;
      return null;
    }
  }

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

  Future<void> validateForm({required BuildContext context}) async {
    final bool _isValid = _formKey.currentState!.validate();
    if (_isValid) {
      await signUp(context: context);
    }
  }

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
