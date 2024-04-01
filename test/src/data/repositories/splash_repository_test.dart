import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:organizame/src/data/repositories/splash_repository.dart';
import 'package:organizame/src/data/services/supabase/supabase_authentication.dart';

class MockSupabase extends Mock implements SupabaseAuthentication {}

void main() {
  late SupabaseAuthentication authentication;
  late SplashRepository repository;

  setUpAll(() => {
        authentication = MockSupabase(),
        repository = SplashRepository(authentication: authentication),
      });

  tearDownAll(() => {
        authentication = MockSupabase(),
        repository = SplashRepository(authentication: authentication),
      });

  test('Should test if exist user authenticated', () async {
    when(() => authentication.checkUserAuthenticated()).thenAnswer((_) {
      return null;
    });

    final sut = repository.verifyUser();

    expect(sut, isA<bool>());
    expect(sut, isFalse);
  });
}
