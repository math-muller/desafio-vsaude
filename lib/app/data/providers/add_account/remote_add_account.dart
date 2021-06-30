import 'package:desafio_vsaude/app/data/models/models.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class RemoteAddAccount {
  final Dio _dio = Get.find<Dio>();

  static const MOBILEPROJECTID = 'fcc80c1d-6040-4e57-a23c-abb301653616';

  static const CREATEPATH = '/services/app/User/CreateMobileUser';

  Future<TokenAuthModel> addAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final Response response = await _dio.post(
        CREATEPATH,
        data: {
          'mobileProjectId': MOBILEPROJECTID,
          'fullName': name,
          'emailAddress': email,
          'password': password
        },
      );
      return TokenAuthModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
