import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class RemoteAddAccount {
  final Dio _dio = Get.find<Dio>();

  static const MOBILEPROJECTID = '3fa85f64-5717-4562-b3fc-2c963f66afa6';

  static const PATH = 'https://hml.vsaude.com.br/api/';

  static const CREATEPATH = 'services/app/User/CreateMobileUser';

  Future<TokenAuthModel> add({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await _dio.post(
        '$PATH$CREATEPATH',
        data: {
          'mobileProjectId': MOBILEPROJECTID,
          'fullName': name,
          'emailAddress': email,
          'password': password,
        },
      );
      return TokenAuthModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
