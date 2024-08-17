// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import '../model/model_register.dart';
import '../utils/utils.dart';

class RegisterService {
  final Dio _dio = Dio();

  Future<ModelRegister> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrlAut + Urls.register,
        data: {
          'email': email,
          'password': password,
          'name': name,
        },
      );
      return ModelRegister.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
