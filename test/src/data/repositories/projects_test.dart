import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:organizame/src/data/model/projects.dart';
import 'package:organizame/src/data/repositories/projects.dart';
import 'package:organizame/src/data/services/supabase/supabase_postgress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupaBaseAuthMock extends Mock implements SupabasePostgress {}

void main() {
  late SupabasePostgress client;
  late ProjectsRepository repository;

  late ProjectModel project;

  setUpAll(() {
    client = SupaBaseAuthMock();
    repository = ProjectsRepository(client: client);

    project = ProjectModel(
      id: '',
      alias: 'TESTE',
      description: 'TESTE',
      createdAt: DateTime.now().toString(),
      status: 'ACTIVE',
    );
  });

  tearDownAll(() {
    client = SupaBaseAuthMock();
    repository = ProjectsRepository(client: client);
  });

  test('Should test the create project with success', () async {
    when(() => client.createData(table: 'PROJECTS', values: project.toMap())).thenAnswer((_) async {
      return null;
    });

    final result = await repository.created(project);

    expect(result.isSuccess(), isTrue);
  });

  test('Should test the create project with bad request postgress excpetion', () async {
    when(() => client.createData(table: 'PROJECTS', values: project.toMap())).thenThrow(
      const PostgrestException(message: '', details: 'Bad Request'),
    );

    final result = await repository.created(project);

    result.onFailure((failure) {
      expect(failure.name, 'invalidData');
    });
  });

  test('Should test the create project with any postgress excpetion', () async {
    when(() => client.createData(table: 'PROJECTS', values: project.toMap())).thenThrow(
      const PostgrestException(message: '', details: ''),
    );

    final result = await repository.created(project);

    result.onFailure((failure) {
      expect(failure.name, 'projectFailure');
    });
  });

  test('Should test the create project with any  excpetion', () async {
    when(() => client.createData(table: 'PROJECTS', values: project.toMap())).thenThrow(Exception());

    final result = await repository.created(project);

    result.onFailure((failure) {
      expect(failure.name, 'projectFailure');
    });
  });
}
