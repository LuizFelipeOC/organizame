import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:organizame/src/data/repositories/profile.dart';
import 'package:organizame/src/data/services/supabase/supabase_authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientMock extends Mock implements SupabaseAuthentication {}

void main() {
  late SupabaseAuthentication client;
  late ProfileRepository repository;

  setUpAll(() {
    client = ClientMock();
    repository = ProfileRepository(client: client);
  });

  tearDownAll(() {
    client = ClientMock();
    repository = ProfileRepository(client: client);
  });

  group('Should test fetch user', () {
    test('if user is null', () async {
      when(() => client.currentUser()).thenAnswer((_) {
        return null;
      });

      final sut = await repository.fetch();

      sut.onFailure((failure) {
        expect(failure.name, 'nullUser');
      });
    });

    test('if occur anywhere excpetion', () async {
      when(() => client.currentUser()).thenThrow(Exception('anywherer error'));

      final sut = await repository.fetch();

      sut.onFailure((failure) {
        expect(failure.name, 'otherError');
      });
    });

    test('if have user authenticated', () async {
      when(() => client.currentUser()).thenAnswer((_) {
        return const User(id: '', appMetadata: {}, userMetadata: {}, aud: '', createdAt: '');
      });

      final sut = await repository.fetch();

      expect(sut.isSuccess(), isTrue);
    });
  });
}
