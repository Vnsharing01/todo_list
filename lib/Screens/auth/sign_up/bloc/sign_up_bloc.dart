import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../routes/routes.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final logger = Logger();
  final dio = Dio();
  SignUpBloc()
      : super(const SignUpState(
          email: '',
          name: '',
          password: '',
          isShowPassword: false,
        )) {
    on<SignUpEvent>((event, emit) {
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

    on<RegisterEvent>((event, emit) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: event.email, password: event.password);
        if (userCredential.user != null) {
          if (!event.context.mounted) return;
          await Navigator.pushReplacementNamed(event.context, Routes.LOGIN);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          logger.w('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          logger.w('The account already exists for that email.');
        }
      } catch (e) {
        logger.e(e);
      }
    });
  }
}
