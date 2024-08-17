import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/model_login.dart';
import '../../services/service_login.dart';

class ViewModelLogin with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  String tokenSharedPreference = "";
  bool isSuksesLogin = false;
  bool isPasswordVisible = false;
  final service = LoginService();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  ModelLogin? modelLogin;

  Future signIn() async {
    try {
      isSuksesLogin = false;
      modelLogin = await service.login(
        email: email.text,
        password: password.text,
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(
        'hasBeenLogin',
        true,
      );
      isSuksesLogin = true;
      
    } catch (e) {
      isSuksesLogin = false;
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
    }
    notifyListeners();
    return null;
  }
}
