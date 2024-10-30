part of 'sign_up_bloc.dart';

@immutable
class SignUpState {
  final bool isShowPassword;
  final String email;
  final String password;
  final String name;
  final String? emailError;
  final String? passwordError;

  const SignUpState({
    required this.isShowPassword,
    required this.email,
    required this.name,
    required this.password,
    this.emailError,
    this.passwordError,
  });

  SignUpState coppyWith({
    bool? isShowPassword,
    String? email,
    String? name,
    String? password,
    String? emailError,
    String? passwordError,
  }) {
    return SignUpState(
      isShowPassword: isShowPassword ?? this.isShowPassword,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }
}

final class SignUpInitial extends SignUpState {
  SignUpInitial(
      {required super.isShowPassword,
      required super.email,
      required super.name,
      required super.password});
}
