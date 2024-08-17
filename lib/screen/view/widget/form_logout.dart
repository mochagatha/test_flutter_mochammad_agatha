// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_screen.dart';

void showDialogLogOut({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Peringatan!!!'),
        content: const Text("Anda Yakin Keluar"),
        actions: [
          TextButton(
            child: const Text('Batal'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Keluar'),
            onPressed: () async {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                'hasBeenLogin',
                false,
              );
            },
          ),
        ],
      );
    },
  );
}
