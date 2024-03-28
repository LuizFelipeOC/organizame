import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:organizame/src/data/repositories/forgot_password.dart';
import 'package:organizame/src/data/services/supabase/supabase_authentication.dart';

class SupaBaseAuthMock extends Mock implements SupabaseAuthentication {}

main() {
  late SupabaseAuthentication authMock;
  late ForgotPasswordRepository repository;

  setUp(() => {
        authMock = SupaBaseAuthMock(),
        repository = ForgotPasswordRepository(authentication: authMock),
      });

  tearDown(() => {
        authMock = SupaBaseAuthMock(),
        repository = ForgotPasswordRepository(authentication: authMock),
      });

  test('Should test send email is success', () async {
    when(() => authMock.resetPassword(email: 'test@test.com')).thenAnswer((_) async {
      return;
    });

    final sut = await repository.send(email: 'test@test.com');

    sut.onSuccess((success) {
      expect(success, isA<SuccessSendForgotPassword>());
    });
  });
}
