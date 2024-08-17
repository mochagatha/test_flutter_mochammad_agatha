import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view_model/view_model_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ViewModelSplashScreen viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ViewModelSplashScreen>(
      context,
      listen: false,
    );
    viewModel.navigateToHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF293066),
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
