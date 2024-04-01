import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../get_it/get_it.dart';
import '../../controller/splash/splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = getIt.get<SplashController>();

  @override
  void initState() {
    _controller.checkUser();

    _controller.addListener(() {
      if (_controller.isAuthenticated == true) {
        return context.pushReplacement('/home');
      }

      return context.pushReplacement('/login');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(),
      ),
    );
  }
}
