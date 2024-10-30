part of 'todo_detail_bloc.dart';

@immutable
sealed class TodoDetailEvent {}

class CheckDoneTask extends TodoDetailEvent {
  final bool isDone;

  CheckDoneTask(this.isDone);
}

class LoadTask extends TodoDetailEvent {
  final NotesModel model;

  LoadTask(this.model);
}
class RemoveTask extends TodoDetailEvent {
  final NotesModel model;

  RemoveTask(this.model);
}
