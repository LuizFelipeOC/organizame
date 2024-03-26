import 'package:supabase_flutter/supabase_flutter.dart';

class InitSupabase {
  final String _url = const String.fromEnvironment('supabaseUrl');
  final String _key = const String.fromEnvironment('supabaseKey');

  Future<void> intiSupabase() async {
    await Supabase.initialize(url: _url, anonKey: _key);
  }
}
