part of 'todo_detail_bloc.dart';

@immutable
class TodoDetailState {
  final NotesModel? notesModel;

  const TodoDetailState({this.notesModel});

  TodoDetailState coppyWith({
    NotesModel? notesModel,
  }) {
    return TodoDetailState(
      notesModel: this.notesModel,
    );
  }
}
