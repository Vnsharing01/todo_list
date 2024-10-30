part of 'home_bloc.dart';

@immutable
class HomeState {
  final List<NotesModel>? listTask;
  final List<NotesModel>? listTaskOpen;
  final List<NotesModel>? listTaskDone;

  const HomeState({
    this.listTask,
    this.listTaskOpen,
    this.listTaskDone,
  });

  HomeState copyWith({
    List<NotesModel>? listTask,
    List<NotesModel>? listTaskOpen,
    List<NotesModel>? listTaskDone,
  }) {
    return HomeState(
      listTask: this.listTask,
      listTaskOpen: this.listTaskOpen,
      listTaskDone: this.listTaskDone,
    );
  }
}
