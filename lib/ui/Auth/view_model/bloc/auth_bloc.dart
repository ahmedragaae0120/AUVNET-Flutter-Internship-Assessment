import 'package:auvnet_task/domain/common/result.dart';
import 'package:auvnet_task/domain/use_cases/auth/login_usecase.dart';
import 'package:auvnet_task/domain/use_cases/auth/signup_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase signupUsecase;
  final LoginUsecase loginUsecase;
  @factoryMethod
  AuthBloc(this.signupUsecase, this.loginUsecase)
      : super(AuthState(status: Status.initial)) {
    on<AuthEvent>((event, emit) {});
  }

  static AuthBloc get(context) => BlocProvider.of<AuthBloc>(context);

  createNewAccount({required String email, required String password}) async {
    emit(state.copyWith(status: Status.loading));
    var result = await signupUsecase.call(email, password);

    switch (result) {
      case Success():
        emit(state.copyWith(status: Status.success, authResponse: result.data));
        break;
      case Error():
        emit(state.copyWith(status: Status.error, exception: result.exception));
        break;
    }
  }

  login({required String email, required String password}) async {
    emit(state.copyWith(status: Status.loading));
    var result = await loginUsecase.call(email: email, password: password);
    switch (result) {
      case Success():
        emit(state.copyWith(status: Status.success, authResponse: result.data));
        break;
      case Error():
        emit(state.copyWith(status: Status.error, exception: result.exception));
        break;
    }
  }
}
