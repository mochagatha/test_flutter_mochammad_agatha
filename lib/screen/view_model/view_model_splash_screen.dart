// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view/home.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view/login_screen.dart';

class ViewModelSplashScreen with ChangeNotifier {
  Future<void> navigateToHome(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? hasBeenLogin = prefs.getBool('hasBeenLogin');
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    if (hasBeenLogin ?? false) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }
}
