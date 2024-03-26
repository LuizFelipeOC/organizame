import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'themes/app_themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.theme,
      routerConfig: AppRoutes.routes,
    );
  }
}
