// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view/home.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view/register_screen.dart';

import '../view_model/view_model_login.dart';
import 'widget/alert_gagal_login.dart';
import 'widget/button_login.dart';
import 'widget/text_form_field_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ViewModelLogin viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ViewModelLogin>(context, listen: false);
    viewModel.isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthMediaQuery = MediaQuery.of(context).size.width;
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
                  height: heightMediaQuery / 2.5,
                  width: widthMediaQuery,
                  decoration: const BoxDecoration(
                    color: Color(0xFF293066),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/logo.png",
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: heightMediaQuery / 3.75,
                left: widthMediaQuery / 15,
                right: widthMediaQuery / 15,
                child: Consumer<ViewModelLogin>(
                  builder: (context, model, child) {
                    return Container(
                      height: heightMediaQuery / 3.7,
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
                                    controller: viewModel.email,
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Color(0xFF484F88),
                                      size: 18,
                                    ),
                                    labelText: "Email",
                                    // validator: (value) =>
                                    //     viewModel.validateEmail(value!),
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
                                    // validator: (value) =>
                                    //     viewModel.validatePassword(value!),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Belum Punya Akun? ',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Klik di sini',
                                          style: const TextStyle(
                                            color: Color(0xFF293066),
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterScreen(),
                                                ),
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Consumer<ViewModelLogin>(
                                builder: (context, viewMode, child) {
                                  return customButton(
                                    text: "Masuk",
                                    bgColor: const Color(0xFF484F88),
                                    onPressed: () async {
                                      if (viewModel.formKey.currentState!
                                          .validate()) {
                                        await viewModel.signIn();
                                        if (viewModel.isSuksesLogin == true) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home(),
                                            ),
                                            (route) => false,
                                          );
                                          viewModel.email.clear();
                                          viewModel.password.clear();
                                          viewModel.isSuksesLogin = false;
                                        } else {
                                          customAlert(
                                            context: context,
                                            alertType: QuickAlertType.error,
                                            text:
                                                'Gagal login mohon periksa email atau kata sandi anda',
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
