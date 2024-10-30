part of 'edit_todo_bloc.dart';

@immutable
class EditTodoState {
  final String? title;
  final String? description;

  const EditTodoState({this.title, this.description});

  EditTodoState coppyWith({
    String? title,
    String? description,
  }) {
    return EditTodoState(
        title: title ?? this.title,
        description: description ?? this.description,
        );
  }
}

final class EditTodoInitial extends EditTodoState {}
