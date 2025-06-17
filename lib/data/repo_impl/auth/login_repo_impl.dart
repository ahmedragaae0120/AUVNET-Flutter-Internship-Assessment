import 'package:auvnet_task/data/data_source_contract/auth/login_datasource.dart';
import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/repo_contract/auth/login_repo.dart';
import 'package:gotrue/src/types/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  LoginDataSource loginDataSource;
  @factoryMethod
  LoginRepoImpl(this.loginDataSource);
  @override
  Future<Result<AuthResponse>> login(
      {required String email, required String password}) async {
    return await loginDataSource.login(email: email, password: password);
  }
}
