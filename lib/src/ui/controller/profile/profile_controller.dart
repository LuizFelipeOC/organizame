import 'package:flutter/material.dart';

import '../../../data/repositories/profile.dart';

class ProfileController {
  final ProfileRepository repository;

  ValueNotifier<String> mail = ValueNotifier('');

  ProfileController({required this.repository});

  Future<void> getUserMail() async {
    final result = await repository.fetch();

    result.fold((success) {
      mail.value = success.user.email!;
    }, (failure) {
      return;
    });
  }
}
