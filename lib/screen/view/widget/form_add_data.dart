// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_home.dart';

void showDialogAddData({
  required BuildContext context,
}) {
  final viewModel = Provider.of<ViewModelHome>(
    context,
    listen: false,
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Tambah Data'),
        content: Form(
          key: viewModel.formKeyAddData,
          child: TextFormField(
            controller: viewModel.addDataName,
            decoration: const InputDecoration(
              labelText: 'Masukkan nama',
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
              viewModel.addDataName.clear();
            },
          ),
          TextButton(
            child: const Text('Tambah'),
            onPressed: () async {
              if (viewModel.formKeyAddData.currentState!.validate()) {
                await viewModel.addData();
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
