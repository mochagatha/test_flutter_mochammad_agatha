// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_home.dart';

void showDialogUpdateData({
  required BuildContext context,
  required String name,
  required String id,
}) {
  final viewModel = Provider.of<ViewModelHome>(
    context,
    listen: false,
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit $name'),
        content: Form(
          key: viewModel.formKeyUpdateData,
          child: TextFormField(
            controller: viewModel.updateName,
            decoration: const InputDecoration(
              labelText: 'Masukkan Nama Baru',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tolong masukkan nama';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Batal'),
            onPressed: () {
              Navigator.of(context).pop();
              viewModel.updateName.clear();
            },
          ),
          TextButton(
            child: const Text('Simpan'),
            onPressed: () async {
              if (viewModel.formKeyUpdateData.currentState!.validate()) {
                await viewModel.updateData(
                  id: id,
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
