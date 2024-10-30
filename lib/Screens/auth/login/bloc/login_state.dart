part of 'login_bloc.dart';

@immutable
class LoginState {
  final bool isShowPassword;
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;

  const LoginState({
    required this.isShowPassword,
    required this.email,
    required this.password,
    this.emailError,
    this.passwordError,
  });

  LoginState coppyWith({
    bool? isShowPassword,
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
  }) {
    return LoginState(
        isShowPassword: isShowPassword ?? this.isShowPassword,
        email: email ?? this.email,
        password: password ?? this.password,
        emailError: emailError ?? this.emailError,
        passwordError: passwordError ?? this.passwordError);
  }
}
