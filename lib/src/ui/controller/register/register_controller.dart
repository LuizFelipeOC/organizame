import 'package:flutter/material.dart';

import '../../../data/model/user_credentials.dart';
import '../../../data/repositories/register_repository.dart';
import '../../../data/repositories/results/register_result.dart';
import 'register_state.dart';

class RegisterController extends ValueNotifier<RegisterState> {
  final RegisterRepository repository;

  UserCredentials credentials = UserCredentials();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController passwordConfirmationController = TextEditingController(text: '');

  RegisterController({required this.repository}) : super(IdleRegisterState());

  Future<void> createAccount() async {
    _emitState(LoadingRegisterState());

    credentials.email = emailController.text.trim();
    credentials.password = passwordController.text.trim();

    final result = await repository.create(credentials: credentials);

    result.fold((success) {
      _emitState(SuccessRegisterState());
    }, (failure) {
      if (failure == RegisterAccountFailures.emailAlreadyExist) {
        return _emitState(EmailAlreadyExistRegisterState());
      }

      _emitState(ErrorRegisterState());
    });
  }

  void _emitState(RegisterState state) => value = state;
}
