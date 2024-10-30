part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class ChangedEmailEvent extends SignUpEvent {
  final String text;

  ChangedEmailEvent({required this.text});
}

class ChangedPasswordEvent extends SignUpEvent {
  final String text;

  ChangedPasswordEvent({required this.text});
}

class ShowPasswordEvent extends SignUpEvent {}

class CheckTextFieldEvent extends SignUpEvent {}

class RegisterEvent extends SignUpEvent {
  final String email;
  final String password;
  final BuildContext context;

  RegisterEvent(this.context, {required this.email, required this.password});
}
