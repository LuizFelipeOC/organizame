import 'package:flutter/cupertino.dart';

import '../../../data/repositories/forgot_password.dart';
import 'forgot_password_state.dart';

class ForgotPasswordController extends ValueNotifier<IForgotRecoveryState> {
  final ForgotPasswordRepository repository;

  TextEditingController emailController = TextEditingController(text: '');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ForgotPasswordController({required this.repository}) : super(IdleSendMailer());

  Future<void> send() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    _emitState(LoadingSendMailer());

    final result = await repository.send(email: emailController.text.trim());

    result.fold((success) {
      return _emitState(SuccessSendMailer());
    }, (failure) {
      debugPrint(failure.name);
      return _emitState(FailureSendMailer());
    });
  }

  void _emitState(IForgotRecoveryState state) => value = state;
}
