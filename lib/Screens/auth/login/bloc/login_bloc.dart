import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginState(
          email: '',
          password: '',
          isShowPassword: false,
        )) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangedEmailEvent>((event, emit) {
      emit(state.coppyWith(email: event.text, emailError: ''));
    });

    on<ChangedPasswordEvent>((event, emit) {
      emit(state.coppyWith(password: event.text, passwordError: ''));
    });

    on<ShowPasswordEvent>((event, emit) {
      bool isShow = !state.isShowPassword;
      emit(state.coppyWith(isShowPassword: isShow));
    });

    on<CheckTextFieldEvent>((event, emit) {
      String emailError = '';
      String passwordError = '';
      if (state.email.isEmpty) {
        emailError = 'Email không được để trống!';
      } else if (state.password.isEmpty) {
        passwordError = 'Chưa nhập password!';
      }
      emit(state.coppyWith(
          emailError: emailError, passwordError: passwordError));
    });
  }
}
