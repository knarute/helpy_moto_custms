import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpy_moto_custms/Authentication/SignUp/Views/SignUpForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: ,
      title: 'Helpy Moto Customer Service Application',
      theme: ThemeData(
        primaryTextTheme: TextTheme(),
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white)),
        useMaterial3: true,
      ),
      home: const SignUpForm(),
    );
  }
}
