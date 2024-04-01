import 'package:flutter/foundation.dart';

import '../../../data/repositories/splash_repository.dart';
import 'splash_state.dart';

class SplashController extends ValueNotifier<SplashState> {
  final SplashRepository repository;

  SplashController({required this.repository}) : super(IdleSplashState());

  bool isAuthenticated = false;

  Future<void> checkUser() async {
    isAuthenticated = repository.verifyUser();

    if (isAuthenticated) {
      return _emit(AuthenticatedSplashState());
    }

    return _emit(NotAuthenticatedSplashState());
  }

  void _emit(SplashState state) {
    value = state;
  }
}
