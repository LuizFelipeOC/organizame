import 'package:supabase_flutter/supabase_flutter.dart';

class SuccessFetchProfile {
  User user;

  SuccessFetchProfile({required this.user});
}

enum ProfileFailures {
  nullUser,
  otherError,
}
