import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_prototype/app/repository/remote/supabase_config.dart';
import 'package:notes_app_prototype/view/note_list_page.dart';
import 'package:notes_app_prototype/view/preparation_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _redirectCalled = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = SupabaseConfig.supabaseClient.auth.currentSession;
    if (session != null) {
      Get.off(() => const NoteListPage());
    } else {
      Get.off(() => const PreparationPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}