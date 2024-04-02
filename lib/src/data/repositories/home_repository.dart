import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/projects.dart';
import '../services/supabase/supabase_authentication.dart';
import 'results/home_result.dart';

class HomeRepository {
  final SupabaseAuthentication client;

  HomeRepository({required this.client});

  AsyncResult<SuccessGetProjects, FailureGetProjects> getProjecs() async {
    try {
      final user = client.client.auth.currentUser!.id;

      final response = await client.client.from('PROJECTS').select('*').eq('user', user);
      return Success(SuccessGetProjects(projects: response.map((e) => ProjectModel.fromMap(e)).toList()));
    } on PostgrestException catch (e) {
      debugPrint(e.message);

      if (e.details == 'Not Found' || e.code == '42P01') {
        return const Failure(FailureGetProjects.notFound);
      }

      if (e.details == 'Bad Request') {
        return const Failure(FailureGetProjects.badRequest);
      }

      return const Failure(FailureGetProjects.badRequest);
    } catch (_) {
      debugPrint(_.toString());
      return const Failure(FailureGetProjects.badRequest);
    }
  }
}
