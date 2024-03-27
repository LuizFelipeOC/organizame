import 'package:flutter/cupertino.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/user_credentials.dart';
import '../services/supabase/supabase_authentication.dart';
import 'results/register_result.dart';

class RegisterRepository {
  late SupabaseAuthentication _authentication;

  RegisterRepository({required SupabaseAuthentication authentication}) {
    _authentication = authentication;
  }

  AsyncResult<RegisterSuccessResult, RegisterAccountFailures> create({required UserCredentials credentials}) async {
    try {
      final response = await _authentication.signUp(email: credentials.email, password: credentials.password);

      return Success(RegisterSuccessResult(accessToken: response.session!.accessToken));
    } on AuthException catch (authErr) {
      debugPrint('${authErr.statusCode} - ${authErr.message}');

      if (authErr.statusCode == "429") {
        return const Failure(RegisterAccountFailures.rateLimitAccess);
      }

      if (authErr.statusCode == "422" && authErr.message == 'Unable to validate email address: invalid format') {
        return const Failure(RegisterAccountFailures.invalidEmail);
      }

      if (authErr.statusCode == "422" && authErr.message == 'Password should be at least 6 characters.') {
        return const Failure(RegisterAccountFailures.invalidPassword);
      }

      if (authErr.statusCode == "400" && authErr.message == 'User already registered') {
        return const Failure(RegisterAccountFailures.emailAlreadyExist);
      }

      return const Failure(RegisterAccountFailures.unknownError);
    } catch (e) {
      return const Failure(RegisterAccountFailures.unknownError);
    }
  }
}
