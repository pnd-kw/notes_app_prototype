import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notes_app_prototype/app/repository/remote/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends StatefulWidget {
  const AuthService({super.key});

  @override
  State<AuthService> createState() => _AuthServiceState();
}

class _AuthServiceState extends State<AuthService> {
  late final StreamSubscription<AuthState> _authSubscription;
  User? _user;

  @override
  void initState() {
    _authSubscription = SupabaseConfig.supabaseClient.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      setState(() {
        _user = session?.user;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        fixedSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        style: Theme.of(context).textTheme.labelLarge,
        'Request OTP',
      ),
      onPressed: () {

      },
    );
  }
}