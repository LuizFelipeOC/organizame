import 'package:flutter/material.dart';

import 'data/services/supabase/init_supabase.dart';
import 'routes/routes.dart';
import 'themes/app_themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final InitSupabase supabase = InitSupabase();

  @override
  void initState() {
    supabase.intiSupabase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.theme,
      routerConfig: AppRoutes.routes,
    );
  }
}
