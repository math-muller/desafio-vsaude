import 'package:desafio_vsaude/app/data/providers/providers.dart';
import 'package:desafio_vsaude/app/data/repositories/authentication/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<Dio>(Dio(BaseOptions(baseUrl: 'https://hml.vsaude.com.br/api')));

    Get.put<RemoteAuthentication>(RemoteAuthentication());

    Get.put<AuthenticationRepository>(AuthenticationRepository());
  }
}
