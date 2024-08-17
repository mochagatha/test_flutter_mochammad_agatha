// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view_model/view_model_register.dart';

import 'widget/alert_gagal_login.dart';
import 'widget/button_login.dart';
import 'widget/text_form_field_login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late ViewModelRegister viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ViewModelRegister>(context, listen: false);
    viewModel.isPasswordVisible = false;
    viewModel.name.clear();
    viewModel.email.clear();
    viewModel.password.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Akun"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: widthMediaQuery,
          height: heightMediaQuery - 100,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  height: heightMediaQuery / 3,
                  width: widthMediaQuery,
                  decoration: const BoxDecoration(
                    color: Color(0xFF293066),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: heightMediaQuery / 5,
                left: widthMediaQuery / 15,
                right: widthMediaQuery / 15,
                child: Consumer<ViewModelRegister>(
                  builder: (context, model, child) {
                    return Container(
                      height: heightMediaQuery / 2.5,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE5E9F4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Form(
                          key: viewModel.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customTextFormField(
                                    controller: viewModel.name,
                                    prefixIcon: const Icon(
                                      Icons.account_circle,
                                      color: Color(0xFF484F88),
                                      size: 18,
                                    ),
                                    labelText: "Name",
                                    validator: (value) =>
                                        viewModel.validateName(value!),
                                  ),
                                  const SizedBox(height: 5),
                                  customTextFormField(
                                    controller: viewModel.email,
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Color(0xFF484F88),
                                      size: 18,
                                    ),
                                    labelText: "Email",
                                    validator: (value) =>
                                        viewModel.validateEmail(value!),
                                  ),
                                  const SizedBox(height: 5),
                                  customTextFormField(
                                    controller: viewModel.password,
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Color(0xFF484F88),
                                      size: 18,
                                    ),
                                    labelText: "Password",
                                    obscureText: !viewModel.isPasswordVisible,
                                    sufixIcon: IconButton(
                                      icon: Icon(
                                        viewModel.isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xFF484F88),
                                      ),
                                      onPressed: () {
                                        viewModel.togglePasswordVisibility();
                                      },
                                    ),
                                    validator: (value) =>
                                        viewModel.validatePassword(value!),
                                  ),
                                ],
                              ),
                              Consumer<ViewModelRegister>(
                                builder: (context, viewMode, child) {
                                  return customButton(
                                    text: "Register",
                                    bgColor: const Color(0xFF484F88),
                                    onPressed: () async {
                                      if (viewModel.formKey.currentState!
                                          .validate()) {
                                        await viewModel.signUp();
                                        if (viewModel.suksesBuatAkun == true) {
                                          customAlert(
                                            context: context,
                                            alertType: QuickAlertType.success,
                                            text: 'Akun Berhasil DiBuat',
                                          );
                                          viewModel.name.clear();
                                          viewModel.email.clear();
                                          viewModel.password.clear();
                                          viewModel.suksesBuatAkun = false;
                                        } else {
                                          customAlert(
                                            context: context,
                                            alertType: QuickAlertType.error,
                                            text:
                                                'Gagal Membuat Akun Mohin Ulangi Lagi',
                                          );
                                        }
                                      }
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
