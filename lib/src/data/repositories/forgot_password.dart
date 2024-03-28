import 'package:result_dart/result_dart.dart';

import '../services/supabase/supabase_authentication.dart';

class ForgotPasswordRepository {
  final SupabaseAuthentication authentication;

  ForgotPasswordRepository({required this.authentication});

  AsyncResult<SuccessSendForgotPassword, FailureSendForgotPassword> send({
    required String email,
  }) async {
    try {
      await authentication.resetPassword(email: email);

      return Success(SuccessSendForgotPassword());
    } catch (_) {
      print(_.toString());

      return const Failure(FailureSendForgotPassword.accountNotExist);
    }
  }
}

class SuccessSendForgotPassword {}

enum FailureSendForgotPassword {
  accountNotExist,
}
