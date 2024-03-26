import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'src/app_widget.dart';

void main() async {
  const String url = String.fromEnvironment('supabaseUrl');
  const String key = String.fromEnvironment('supabaseKey');

  await Supabase.initialize(url: url, anonKey: key);

  runApp(const AppWidget());
}
