import 'package:flutter/foundation.dart';

import '../../../data/repositories/splash_repository.dart';

class SplashController extends ChangeNotifier {
  final SplashRepository repository;

  SplashController({required this.repository});

  bool isAuthenticated = false;

  Future<void> checkUser() async {
    isAuthenticated = repository.verifyUser();

    notifyListeners();
  }
}
