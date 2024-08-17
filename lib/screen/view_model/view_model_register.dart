// ignore_for_file: empty_catches

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tast_flutter_mochammad_agatha/model/model_register.dart';
import 'package:tast_flutter_mochammad_agatha/services/service_register.dart';

class ViewModelRegister with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool suksesBuatAkun = false;
  final service = RegisterService();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  ModelRegister? modelRegister;

  Future signUp() async {
    try {
      suksesBuatAkun = false;
      modelRegister = await service.register(
        email: email.text,
        password: password.text,
        name: name.text,
      );
      suksesBuatAkun = true;
    } catch (e) {
      suksesBuatAkun = false;
    }
    notifyListeners();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!EmailValidator.validate(value)) {
      return 'Format email salah';
    }
    notifyListeners();
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password tidak boleh kosong';
  } else if (value.length < 8) {
    return 'Password harus minimal 8 karakter';
  }
  notifyListeners();
  return null;
}


    String? validateName(String value) {
    if (value.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (value.length < 2) {
    return 'Nama harus minimal 2 karakter';
  }
    notifyListeners();
    return null;
  }
}
