
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final String username;
  final String password;
  final bool usernameValid;
  final bool passwordValid;

  const LoginState({
    this.username = '',
    this.password = '',
    this.usernameValid = true,
    this.passwordValid = true,
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? usernameValid,
    bool? passwordValid,
  }) {
    return LoginInitial(
      username: username ?? this.username,
      password: password ?? this.password,
      usernameValid: usernameValid ?? this.usernameValid,
      passwordValid: passwordValid ?? this.passwordValid,
    );
  }

  @override
  List<Object> get props => [username, password, usernameValid, passwordValid];
}

class LoginInitial extends LoginState {
  const LoginInitial({
    String username = '',
    String password = '',
    bool usernameValid = true,
    bool passwordValid = true,
  }) : super(
          username: username,
          password: password,
          usernameValid: usernameValid,
          passwordValid: passwordValid,
        );
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {

  const LoginFailure({
    String username = '',
    String password = '',
    bool usernameValid = false,
    bool passwordValid = false,
  }) : super(
          username: username,
          password: password,
          usernameValid: usernameValid,
          passwordValid: passwordValid,
        );

  @override
  List<Object> get props => [username, password, usernameValid, passwordValid];
}

class LoginSuccess extends LoginState {}
