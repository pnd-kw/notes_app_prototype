import 'package:flutter/material.dart';
import 'package:notes_app_prototype/app/repository/remote/supabase_config.dart';
import 'package:notes_app_prototype/view/note_list_page.dart';
import 'package:notes_app_prototype/view/preparation_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class SupabaseHelper extends StatefulWidget {
  const SupabaseHelper({super.key});

  @override
  State<SupabaseHelper> createState() => _SupabaseHelperState();
}

class _SupabaseHelperState extends State<SupabaseHelper> {
  User? _user;

  @override
  void initState() {
    _getAuth();
    super.initState();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = SupabaseConfig.supabaseClient.auth.currentUser;
    });
    SupabaseConfig.supabaseClient.auth.onAuthStateChange.listen((data) {
      setState(() {
        _user = data.session?.user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _user == null ? const PreparationPage() : const NoteListPage(),
    );
  }
}