import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String apiUrl = 'https://zsxhchfyyzrcqxdgbfmd.supabase.co';
  static const String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpzeGhjaGZ5eXpyY3F4ZGdiZm1kIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzMwNjMyNjUsImV4cCI6MTk4ODYzOTI2NX0.CPeuFPT46ZSBhOGdBEyf1IBP5ohwcTQjcS-a6zxJZWc';

  static SupabaseClient supabaseClient = SupabaseClient(apiUrl, apiKey);
}
