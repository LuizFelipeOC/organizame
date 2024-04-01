import '../../model/projects.dart';

enum FailureGetProjects { badRequest, notFound, otherError }

class SuccessGetProjects {
  List<ProjectModel> projects;

  SuccessGetProjects({required this.projects});
}
