// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/view_model_home.dart';

void showDialogDeleteData({
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
        title: const Text('Peringatan!!!'),
        content: Text("Anda Yakin Ingin Menghapus $name"),
        actions: [
          TextButton(
            child: const Text('Batal'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Hapus'),
            onPressed: () async {
              await viewModel.deleteData(
                id: id,
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
