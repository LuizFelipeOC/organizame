import '../../../get_it/get_it.dart';
import 'supabase_authentication.dart';

class SupabasePostgress {
  final _client = getIt.get<SupabaseAuthentication>();

  Future<dynamic> createData({required String table, required Object values}) async {
    final data = values as Map<String, dynamic>;

    data.addAll({'user': _client.client.auth.currentUser!.id});
    return await _client.client.from(table).insert(data);
  }
}
