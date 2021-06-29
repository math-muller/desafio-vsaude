import 'package:get/get.dart';

import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:desafio_vsaude/app/data/providers/providers.dart';

class AddAccountRepository {
  final RemoteAddAccount _remote = Get.find<RemoteAddAccount>();

  Future<TokenAuthModel> add({
    required String name,
    required String email,
    required String password,
  }) async =>
      _remote.add(
        name: name,
        email: email,
        password: password,
      );
}
