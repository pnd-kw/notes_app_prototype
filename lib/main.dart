import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_prototype/app/style/fonts.dart';
import 'package:notes_app_prototype/view/preparation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: appTextTheme,
      ),
      debugShowCheckedModeBanner: false,
      home: const PreparationPage(),
    );
  }
}