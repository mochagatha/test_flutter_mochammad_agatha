import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view/splash_screen.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view_model/view_model_register.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view_model/view_model_splash_screen.dart';

import 'screen/view_model/view_model_home.dart';
import 'screen/view_model/view_model_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ViewModelSplashScreen(),
        ),
        ChangeNotifierProvider(
          create: (_) => ViewModelLogin(),
        ),
        ChangeNotifierProvider(
          create: (_) => ViewModelRegister(),
        ),
        ChangeNotifierProvider(
          create: (_) => ViewModelHome(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF293066),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
