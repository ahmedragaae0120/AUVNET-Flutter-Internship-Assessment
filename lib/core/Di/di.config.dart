// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../../data/data_source_contract/auth/login_datasource.dart' as _i1048;
import '../../data/data_source_contract/auth/signup_datasource.dart' as _i561;
import '../../data/data_source_contract/home_datasource.dart' as _i102;
import '../../data/data_source_impl/auth/login_datasource_impl.dart' as _i1013;
import '../../data/data_source_impl/auth/signup_datasource_impl.dart' as _i421;
import '../../data/data_source_impl/home_datasource_impl.dart' as _i241;
import '../../data/repo_impl/auth/login_repo_impl.dart' as _i314;
import '../../data/repo_impl/auth/signup_repo_impl.dart' as _i99;
import '../../data/repo_impl/home_repo_impl.dart' as _i216;
import '../../domain/repo_contract/auth/login_repo.dart' as _i284;
import '../../domain/repo_contract/auth/signup_repo.dart' as _i937;
import '../../domain/repo_contract/home_repo.dart' as _i742;
import '../../domain/use_cases/auth/login_usecase.dart' as _i912;
import '../../domain/use_cases/auth/signup_usecase.dart' as _i388;
import '../../domain/use_cases/get_popular_restaurants_usecase.dart' as _i653;
import '../../domain/use_cases/get_services_usecase.dart' as _i846;
import '../../domain/use_cases/get_shortcuts_usecase.dart' as _i1049;
import '../../ui/Auth/view_model/bloc/auth_bloc.dart' as _i1002;
import '../../ui/tabs/home/view_model/bloc/home_bloc.dart' as _i446;
import '../logger/logger_module.dart' as _i279;
import '../services/supabase/supabase_helper.dart' as _i906;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    gh.singleton<_i906.SupabaseHelper>(() => _i906.SupabaseHelper());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.loggerProvider);
    gh.lazySingleton<_i974.PrettyPrinter>(() => loggerModule.prettyPrinter);
    gh.factory<_i102.HomeDataSource>(
        () => _i241.HomeDatasourceImpl(gh<_i906.SupabaseHelper>()));
    gh.factory<_i561.SignupDatasource>(
        () => _i421.SignupDataSourceImpl(gh<_i906.SupabaseHelper>()));
    gh.factory<_i1048.LoginDataSource>(
        () => _i1013.LoginDataSourceImpl(gh<_i906.SupabaseHelper>()));
    gh.factory<_i742.HomeRepo>(
        () => _i216.HomeRepoImpl(gh<_i102.HomeDataSource>()));
    gh.factory<_i937.SignupRepo>(
        () => _i99.SignupRepoImpl(gh<_i561.SignupDatasource>()));
    gh.factory<_i284.LoginRepo>(
        () => _i314.LoginRepoImpl(gh<_i1048.LoginDataSource>()));
    gh.factory<_i653.GetPopularRestaurantsUsecase>(
        () => _i653.GetPopularRestaurantsUsecase(gh<_i742.HomeRepo>()));
    gh.factory<_i846.GetServicesUsecase>(
        () => _i846.GetServicesUsecase(gh<_i742.HomeRepo>()));
    gh.factory<_i1049.GetShortcutsUsecase>(
        () => _i1049.GetShortcutsUsecase(gh<_i742.HomeRepo>()));
    gh.factory<_i912.LoginUsecase>(
        () => _i912.LoginUsecase(gh<_i284.LoginRepo>()));
    gh.factory<_i388.SignupUsecase>(
        () => _i388.SignupUsecase(gh<_i937.SignupRepo>()));
    gh.factory<_i1002.AuthBloc>(() => _i1002.AuthBloc(
          gh<_i388.SignupUsecase>(),
          gh<_i912.LoginUsecase>(),
        ));
    gh.factory<_i446.HomeBloc>(() => _i446.HomeBloc(
          gh<_i653.GetPopularRestaurantsUsecase>(),
          gh<_i846.GetServicesUsecase>(),
          gh<_i1049.GetShortcutsUsecase>(),
        ));
    return this;
  }
}

class _$LoggerModule extends _i279.LoggerModule {}
