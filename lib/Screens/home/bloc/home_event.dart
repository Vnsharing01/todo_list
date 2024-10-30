part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class CheckDoneTask extends HomeEvent {
  final NotesModel model;

  CheckDoneTask(this.model);
}

class RemoveTask extends HomeEvent {
  final NotesModel model;

  RemoveTask(this.model);
}

class LoadTask extends HomeEvent {
  LoadTask();
}
class ShowListOpen extends HomeEvent {
  ShowListOpen();
}

class ShowListDone extends HomeEvent {
  ShowListDone();
}
