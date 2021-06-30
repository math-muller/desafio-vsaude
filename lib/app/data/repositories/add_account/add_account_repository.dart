import 'package:get/get.dart';

import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:desafio_vsaude/app/data/providers/providers.dart';

class AddAccountRepository {
  final RemoteAddAccount _remote = Get.find<RemoteAddAccount>();

  Future<TokenAuthModel> addAccount({
    required String name,
    required String email,
    required String password,
  }) async =>
      _remote.addAccount(
        name: name,
        email: email,
        password: password,
      );
}
