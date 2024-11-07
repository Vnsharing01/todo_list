import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../routes/routes.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final logger;
  final dio;
  LoginBloc()
      : logger = Logger(),
        dio = Dio(),
        super(const LoginState(
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

    on<SignInEvent>((event, emit) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: state.email, password: state.password);
        if (userCredential.user != null) {
          await userCredential.user!.getIdToken();
          if (!event.context.mounted) return;
          await Navigator.pushReplacementNamed(event.context, Routes.HOME);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          logger.w('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          logger.w('Wrong password provided for that user.');
        } else {
          logger.w(e);
        }
      } catch (e) {
        logger.e(e);
      }
    });
  }
}
