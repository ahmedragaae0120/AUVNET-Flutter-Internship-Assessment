import 'package:auvnet_task/domain/common/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignupDatasource {
  Future<Result<AuthResponse>> createNewAccount(
      {required String email, required String password});
}
