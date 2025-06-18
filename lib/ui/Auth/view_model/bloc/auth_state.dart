part of 'auth_bloc.dart';

enum Status { initial, loading, success, error, services, shortcut, popular }

// ignore: must_be_immutable
class AuthState extends Equatable {
  Status status;
  Exception? exception;
  AuthResponse? authResponse;
  AuthState({required this.status, this.exception, this.authResponse});

  AuthState copyWith({
    Status? status,
    Exception? exception,
    AuthResponse? authResponse,
  }) {
    return AuthState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      authResponse: authResponse ?? this.authResponse,
    );
  }

  @override
  List<Object?> get props => [status, exception, authResponse];
}
