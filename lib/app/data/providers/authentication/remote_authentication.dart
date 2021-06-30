import 'package:get/get.dart' hide Response;

import '../../models/models.dart';

import 'package:dio/dio.dart';

class RemoteAuthentication {
  final Dio _dio = Get.find<Dio>();

  static const MOBILEPROJECTID = 'fcc80c1d-6040-4e57-a23c-abb301653616';

  static const EMAILPATH = '/services/app/User/ValidateEmailForMobileProject';
  static const AUTHPATH = '/TokenAuth/AuthenticateMobileUser';

  Future<int> authEmail({required String email}) async {
    try {
      final Response response = await _dio.post(
        EMAILPATH,
        queryParameters: {'email': email, 'mobileProjectId': MOBILEPROJECTID},
      );
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<TokenAuthModel> authEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await _dio.post(
        AUTHPATH,
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

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return 200;
      case 500:
        return 500;
      default:
        throw Exception();
    }
  }
}
