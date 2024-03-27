import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:organizame/src/data/model/user_credentials.dart';
import 'package:organizame/src/data/repositories/register_repository.dart';
import 'package:organizame/src/data/repositories/results/register_result.dart';
import 'package:organizame/src/data/services/supabase/supabase_authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseAuthMock extends Mock implements SupabaseAuthentication {}

void main() {
  late SupabaseAuthentication authentication;
  late RegisterRepository repository;

  late UserCredentials userCredential;

  setUpAll(() => {
        authentication = SupaBaseAuthMock(),
        repository = RegisterRepository(authentication: authentication),
        userCredential = UserCredentials(email: 'test@test.com', password: '12345678'),
      });

  tearDownAll(() => {
        authentication = SupaBaseAuthMock(),
        repository = RegisterRepository(authentication: authentication),
      });

  test('Should test when occur auth exception', () async {
    when(() => authentication.signUp(email: userCredential.email, password: userCredential.password)).thenThrow(
      const AuthException('dynamic message returned of supabase', statusCode: "429"),
    );

    final sut = await repository.create(credentials: userCredential);

    sut.onFailure((failure) {
      expect(failure, RegisterAccountFailures.rateLimitAccess);
    });
  });

  test('Should test when occur invalid email format', () async {
    when(() => authentication.signUp(email: userCredential.email, password: userCredential.password)).thenThrow(
      const AuthException('Unable to validate email address: invalid format', statusCode: "422"),
    );

    final sut = await repository.create(credentials: userCredential);

    sut.onFailure((failure) {
      expect(failure, RegisterAccountFailures.invalidEmail);
    });
  });

  test('Should test when occur auth exception', () async {
    when(() => authentication.signUp(email: userCredential.email, password: userCredential.password)).thenThrow(
      const AuthException('Password should be at least 6 characters.', statusCode: "422"),
    );

    final sut = await repository.create(credentials: userCredential);

    sut.onFailure((failure) {
      expect(failure, RegisterAccountFailures.invalidPassword);
    });
  });

  test('Should test when occur auth exception', () async {
    when(() => authentication.signUp(email: userCredential.email, password: userCredential.password)).thenThrow(
      const AuthException('User already registered', statusCode: "400"),
    );

    final sut = await repository.create(credentials: userCredential);

    sut.onFailure((failure) {
      expect(failure, RegisterAccountFailures.emailAlreadyExist);
    });
  });
}
