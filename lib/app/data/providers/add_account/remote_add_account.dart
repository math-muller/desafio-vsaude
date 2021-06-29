import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class RemoteAddAccount {
  final Dio _dio = Get.find<Dio>();

  static const MOBILEPROJECTID = '3fa85f64-5717-4562-b3fc-2c963f66afa6';

  static const PATH = 'https://hml.vsaude.com.br/api/';

  static const CREATEPATH = 'services/app/User/CreateMobileUser';

  add() {}
}
