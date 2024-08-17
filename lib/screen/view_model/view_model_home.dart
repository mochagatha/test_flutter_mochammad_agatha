// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:tast_flutter_mochammad_agatha/model/model_get_all_data.dart';
import 'package:tast_flutter_mochammad_agatha/model/model_update_data.dart';
import 'package:tast_flutter_mochammad_agatha/services/service_home.dart';

import '../../model/model_add_data.dart';
import '../../model/model_delete_data.dart';

class ViewModelHome with ChangeNotifier {
  bool isLoading = false;
  List<ModelGetAllData>? modelGetAllData;
  ModelUpdateData? modelUpdateData;
  ModelAddData? modelAddData;
  ModelDeleteData? modelDeleteData;
  final service = HomeService();
  final TextEditingController updateName = TextEditingController();
  final TextEditingController addDataName = TextEditingController();
  final formKeyUpdateData = GlobalKey<FormState>();
  final formKeyAddData = GlobalKey<FormState>();

  Future getAllData() async {
    try {
      isLoading = true;
      modelGetAllData = await service.getAllData();
      isLoading = false;
    } catch (e) {
      isLoading = true;
    }
    notifyListeners();
  }

  Future updateData({
    required String id,
  }) async {
    try {
      modelUpdateData = await service.updateData(
        id: id,
        name: updateName.text,
      );
      getAllData();
      updateName.clear();
    } catch (e) {}
    notifyListeners();
  }

  Future addData() async {
    try {
      modelAddData = await service.addData(
        name: addDataName.text,
      );
      getAllData();
      addDataName.clear();
    } catch (e) {}
    notifyListeners();
  }

  Future deleteData({
    required String id,
  }) async {
    try {
      modelDeleteData = await service.deleteData(
        id: id,
      );
      getAllData();
    } catch (e) {}
    notifyListeners();
  }
}
