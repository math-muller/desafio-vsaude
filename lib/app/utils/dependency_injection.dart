import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/providers/providers.dart';
import '../data/repositories/repositories.dart';

class DependencyInjection {
  static void init() {
    Get.put<Dio>(Dio(BaseOptions(baseUrl: 'https://hml.vsaude.com.br/api')));

    Get.put<RemoteAddAccount>(RemoteAddAccount());
    Get.put<RemoteAuthentication>(RemoteAuthentication());

    Get.put<AddAccountRepository>(AddAccountRepository());
    Get.put<AuthenticationRepository>(AuthenticationRepository());
  }
}
