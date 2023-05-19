import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BuildContext _context;

  LoginBloc({required BuildContext context})
      : _context = context,
        super(const LoginInitial()) {
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onUsernameChanged(UsernameChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(username: event.username));
  }

  Future<void> _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    // Add your validation logic here
    bool usernameValid = state.username == 'admin';
    bool passwordValid = state.password == 'admin';

    if (!usernameValid || !passwordValid) {
      emit(LoginFailure(
        username: state.username,
        password: state.password,
        usernameValid: usernameValid,
        passwordValid: passwordValid,
      ));
      return;
    }

    emit(LoginLoading());
    await Future.delayed(Duration(seconds: 3));

    Beamer.of(_context).beamToNamed('/dashboard');
  }
}
