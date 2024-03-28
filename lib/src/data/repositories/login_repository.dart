import 'package:flutter/cupertino.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/user_credentials.dart';
import '../services/supabase/supabase_authentication.dart';
import 'results/login_result.dart';

class LoginRepository {
  final SupabaseAuthentication authentication;

  LoginRepository({required this.authentication});

  AsyncResult<SuccessLogin, LoginFailures> login({required UserCredentials credentials}) async {
    try {
      await authentication.login(email: credentials.email, password: credentials.password);

      return Success(SuccessLogin());
    } on AuthException catch (err) {
      debugPrint('${err.statusCode} - ${err.message}');

      if (err.statusCode == "400" && err.message == "Invalid login credentials") {
        return const Failure(LoginFailures.invalidCredentials);
      }

      return const Failure(LoginFailures.unknownErrors);
    } catch (_) {
      debugPrint(_.toString());

      return const Failure(LoginFailures.unknownErrors);
    }
  }
}
