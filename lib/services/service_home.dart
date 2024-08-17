// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:tast_flutter_mochammad_agatha/model/model_add_data.dart';
import 'package:tast_flutter_mochammad_agatha/model/model_delete_data.dart';
import 'package:tast_flutter_mochammad_agatha/model/model_get_all_data.dart';
import 'package:tast_flutter_mochammad_agatha/model/model_update_data.dart';

import '../utils/utils.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<List<ModelGetAllData>> getAllData() async {
    try {
      final response = await _dio.get(
        Urls.baseUrlCrud,
      );
      return ModelGetAllData.fromJsonList(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelAddData> addData({
    required String name,
  }) async {
    try {
      final response = await _dio.post(
        Urls.baseUrlCrud,
        data: {
          'name': name,
        },
      );
      return ModelAddData.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelDeleteData> deleteData({
    required String id,
  }) async {
    try {
      final response = await _dio.delete(
        "${Urls.baseUrlCrud}/$id",
      );
      return ModelDeleteData.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  Future<ModelUpdateData> updateData({
    required String id,
    required String name,
  }) async {
    try {
      final response = await _dio.put(
        "${Urls.baseUrlCrud}/$id",
        data: {
          'name': name,
        },
      );
      return ModelUpdateData.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }
}
