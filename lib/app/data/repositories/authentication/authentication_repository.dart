import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:desafio_vsaude/app/data/providers/providers.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  final RemoteAuthentication _remote = Get.find<RemoteAuthentication>();

  Future<int> authEmail({required String email}) async =>
      _remote.authEmail(email: email);

  Future<TokenAuthModel> authEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      _remote.authEmailAndPassword(email: email, password: password);
}
