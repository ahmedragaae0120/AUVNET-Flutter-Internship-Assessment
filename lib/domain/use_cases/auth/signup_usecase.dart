import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/auth/signup_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class SignupUsecase {
  final SignupRepo repo;
  @factoryMethod
  SignupUsecase(this.repo);
  Future<Result<AuthResponse>> call(String email, String password) async {
    return await repo.createNewAccount(email: email, password: password);
  }
}
