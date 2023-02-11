import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_prototype/app/repository/remote/supabase_config.dart';
import 'package:notes_app_prototype/app/style/fonts.dart';
import 'package:notes_app_prototype/view/splash_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: SupabaseConfig.apiUrl, anonKey: SupabaseConfig.apiKey);


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
      home: const SplashPage(),
    );
  }
}
