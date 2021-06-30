import 'package:get/get.dart';

import '../../models/models.dart';
import '../../providers/providers.dart';

class AuthenticationRepository {
  final RemoteAuthentication _remote = Get.find<RemoteAuthentication>();

  Future<int> authEmail({required String email}) =>
      _remote.authEmail(email: email);

  Future<TokenAuthModel> authEmailAndPassword({
    required String email,
    required String password,
  }) =>
      _remote.authEmailAndPassword(email: email, password: password);
}
