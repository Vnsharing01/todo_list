part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class ChangedEmailEvent extends LoginEvent {
  final String text;

  ChangedEmailEvent({required this.text});
}

class ChangedPasswordEvent extends LoginEvent {
  final String text;

  ChangedPasswordEvent({required this.text});
}

class ShowPasswordEvent extends LoginEvent {}

class CheckTextFieldEvent extends LoginEvent {}
class SignInEvent extends LoginEvent {
  final BuildContext context;

  SignInEvent(this.context);
}
