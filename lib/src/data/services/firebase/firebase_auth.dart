import 'package:firebase_auth/firebase_auth.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/models/user/register_model.dart';
import 'firebase_results/firebase_auth_result.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AsyncResult<SuccessAuthentication, FailureAuthentication> createAccount({required RegisterModel form}) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
        email: form.email,
        password: form.password,
      );

      await response.user?.updateDisplayName(form.username);
      await response.user?.reload();

      return Success(SuccessAuthentication(user: response.user));
    } on FirebaseAuthException catch (authErr) {
      return Failure(FailureAuthentication(code: authErr.code, message: authErr.message));
    } catch (e) {
      return Failure(FailureAuthentication(message: e.toString()));
    }
  }
}
