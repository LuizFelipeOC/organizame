import '../services/supabase/supabase_authentication.dart';

class SplashRepository {
  final SupabaseAuthentication authentication;

  SplashRepository({required this.authentication});

  bool verifyUser() {
    final session = authentication.checkUserAuthenticated();

    if (session == null) return false;

    return true;
  }
}
