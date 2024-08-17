// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

import '../model/model_login.dart';
import '../utils/utils.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<ModelLogin> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrlAut + Urls.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      return ModelLogin.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
