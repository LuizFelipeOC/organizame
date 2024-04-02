import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/projects.dart';
import '../services/supabase/supabase_postgress.dart';
import 'results/projects_results.dart';

class ProjectsRepository {
  final SupabasePostgress client;

  ProjectsRepository({required this.client});

  AsyncResult<SuccessProject, FailuresProject> created(ProjectModel project) async {
    try {
      await client.createData(table: 'PROJECTS', values: project.toMap());

      return Success(SuccessProject());
    } on PostgrestException catch (err) {
      debugPrint('${err.code} - ${err.message} - ${err.details}');

      if (err.details == 'Bad Request') {
        return const Failure(FailuresProject.invalidData);
      }

      return const Failure(FailuresProject.projectFailure);
    } catch (e) {
      debugPrint(e.toString());
      return const Failure(FailuresProject.projectFailure);
    }
  }
}
