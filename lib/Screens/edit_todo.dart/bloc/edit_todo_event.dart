part of 'edit_todo_bloc.dart';

@immutable
sealed class EditTodoEvent {}

class LoadTask extends EditTodoEvent {
  final NotesModel? model;

  LoadTask({this.model});
}

class ChangedTitleEvent extends EditTodoEvent {
  final String text;

  ChangedTitleEvent({required this.text});
}

class ChangedDescriptionEvent extends EditTodoEvent {
  final String text;

  ChangedDescriptionEvent({required this.text});
}
