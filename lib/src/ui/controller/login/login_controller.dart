import 'package:flutter/cupertino.dart';

import '../../../data/model/user_credentials.dart';
import '../../../data/repositories/login_repository.dart';
import '../../../data/repositories/results/login_result.dart';
import 'login_result.dart';

class LoginController extends ValueNotifier<ILogin> {
  final LoginRepository repository;

  late UserCredentials _credentials;

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  final GlobalKey<FormState> formController = GlobalKey<FormState>();

  LoginController({required this.repository}) : super(IdleLoginState());

  Future<void> login() async {
    value = LoadingLoginState();

    if (!formController.currentState!.validate()) {
      return;
    }

    _credentials = UserCredentials(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    final result = await repository.login(credentials: _credentials);

    result.fold((success) {
      return _emit(SuccessLoginState());
    }, (failure) {
      print(failure);

      if (failure == LoginFailures.invalidCredentials) {
        return _emit(InvalidCredentials());
      }

      _emit(ErrorLoginCredentials());
    });
  }

  void _emit(ILogin state) {
    value = state;
  }
}
