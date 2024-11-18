

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:todo_list/Screens/todo_detail/repository/todo_detail_repository.dart';

import '../../../api/api_client.dart';
import '../../../models/notes_model.dart';

part 'todo_detail_event.dart';
part 'todo_detail_state.dart';

class TodoDetailBloc extends Bloc<TodoDetailEvent, TodoDetailState> {
  final logger = Logger();
  final repository = TodoDetailRepository(ApiClient());
  TodoDetailBloc() : super(const TodoDetailState()) {
    on<TodoDetailEvent>((event, emit) {});

    on<LoadTask>((event, emit) async {
      final task = await getDetailTask(event.model.id!);
      emit(TodoDetailState(notesModel: task));
    });
    on<CheckDoneTask>((event, emit)async  {
      final model = state.notesModel?.copyWith(isDone: !event.isDone);
      final task = await updateTaskState(model!);
      emit(TodoDetailState(notesModel: task));
    });
    on<RemoveTask>((event, emit) async {
      final res = await deleteTask(event.model.id!);
      emit(TodoDetailState(notesModel: res));
    });
  }

  Future getDetailTask(String id) async {
    final task = await repository.getDetailTodo(id);
    return task;
  }

  Future updateTaskState(NotesModel model) async {
    final data = await repository.updateTask(model);
    return data;
  }

  Future deleteTask(String id) async {
    final data = await repository.removeTask(id);
    return data;
  }
}
