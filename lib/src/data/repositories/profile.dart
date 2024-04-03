import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';

import '../services/supabase/supabase_authentication.dart';
import 'results/profile_result.dart';

class ProfileRepository {
  final SupabaseAuthentication client;

  ProfileRepository({required this.client});

  AsyncResult<SuccessFetchProfile, ProfileFailures> fetch() async {
    try {
      final user = client.currentUser();

      if (user == null) {
        return const Failure(ProfileFailures.nullUser);
      }

      return Success(SuccessFetchProfile(user: user));
    } catch (_) {
      debugPrint(_.toString());
      return const Failure(ProfileFailures.otherError);
    }
  }
}
