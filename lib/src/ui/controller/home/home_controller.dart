import 'package:flutter/foundation.dart';

import '../../../data/model/projects.dart';
import '../../../data/repositories/home_repository.dart';

class HomeController {
  final HomeRepository repository;

  HomeController({required this.repository});

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<List<ProjectModel>> projects = ValueNotifier([]);

  Future<void> fetch() async {
    isLoading.value = true;

    final res = await repository.getProjecs();

    res.fold((success) {
      projects.value = success.projects;
    }, (failure) {
      print(failure.name);
    });

    isLoading.value = false;
  }
}
