import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hindustan_food/bindings/dependency_injection.dart';
import 'package:hindustan_food/custom_utils/custom_themes.dart';
import 'package:hindustan_food/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hindustan Foods',
      theme: lightTheme,
      // home: const HomePage(),
      home: const SplashScreen(),
    );
  }
}


// launcher_icon.png