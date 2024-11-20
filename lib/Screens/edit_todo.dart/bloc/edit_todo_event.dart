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

class UpdateTask extends EditTodoEvent {
  final BuildContext context;
  final NotesModel? model;

  UpdateTask(this.context, {this.model});
}

class AddNewTask extends EditTodoEvent {
  final NotesModel? model;
  final BuildContext context;

  AddNewTask(this.context, {this.model});
}
