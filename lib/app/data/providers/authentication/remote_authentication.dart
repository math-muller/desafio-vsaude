import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:get/get.dart' hide Response;

import 'package:dio/dio.dart';

class RemoteAuthentication {
  final Dio _dio = Get.find<Dio>();

  static const MOBILEPROJECTID = 'fcc80c1d-6040-4e57-a23c-abb301653616';

  static const PATH = 'https://hml.vsaude.com.br/api/';

  static const EMAILPATH = 'services/app/User/ValidateEmailForMobileProject';
  static const AUTHPATH = 'TokenAuth/AuthenticateMobileUser';

  Future<int> authEmail({required String email}) async {
    try {
      final Response response = await _dio.post(
        '$PATH$EMAILPATH',
        data: {'email': email, 'mobileProjectId': MOBILEPROJECTID},
      );
      return response.statusCode!;
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return e.response!.statusCode!;
        }
      }
      rethrow;
    }
  }

  Future<TokenAuthModel> authEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await _dio.post(
        '$PATH$AUTHPATH',
        data: {
          'userNameOrEmailAddress': email,
          'password': password,
          'mobileProjectId': MOBILEPROJECTID
        },
      );
      return TokenAuthModel.fromJson(response.data['result']);
    } catch (e) {
      rethrow;
    }
  }
}
