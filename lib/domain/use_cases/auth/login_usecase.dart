import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/auth/login_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class LoginUsecase {
  final LoginRepo loginRepo;
  @factoryMethod
  LoginUsecase(this.loginRepo);

  Future<Result<AuthResponse>> call(
      {required String email, required String password}) async {
    return await loginRepo.login(email: email, password: password);
  }
}
