import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/Screens/auth/login/repository/login_repository.dart';
import 'package:todo_list/api/api_client.dart';

import '../../../../routes/routes.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final logger = Logger();
  final dio = Dio();
  final loginRepository = LoginRepository(ApiClient());

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

    on<SignInEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      try {
        final res = await loginRepository.login(state.email, state.password);
        logger.f("res: $res");

        if (res != null) {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: state.email, password: state.password);
          if (userCredential.user != null) {
            await userCredential.user!.getIdToken();
            if (!event.context.mounted) return;
            prefs.setString('UserId', res.id);
            await Navigator.pushNamedAndRemoveUntil(
              event.context,
              Routes.HOME,
              (route) => false,
            );
          }
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
