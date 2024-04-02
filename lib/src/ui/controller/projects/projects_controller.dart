import 'package:flutter/widgets.dart';

import '../../../data/model/projects.dart';
import '../../../data/repositories/projects.dart';
import 'projects_results.dart';

class ProjectController extends ValueNotifier<ProjectState> {
  final ProjectsRepository repository;

  late ProjectModel _projectModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController aliasController = TextEditingController(text: '');
  TextEditingController descriptionController = TextEditingController(text: '');

  ProjectController({required this.repository}) : super(IdleProjectState());

  Future<void> create() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    value = LoadingProjectState();

    await Future.delayed(const Duration(seconds: 1));

    _projectModel = ProjectModel(
      id: '',
      alias: aliasController.text.trim(),
      description: descriptionController.text.toString().trim(),
      createdAt: DateTime.now().toString(),
      status: 'ACTIVE',
    );

    final result = await repository.created(_projectModel);

    result.fold((success) {
      value = SuccessProjectState();
    }, (failure) {
      debugPrint(failure.name);
      value = ErrorProjectState();
    });
  }
}
