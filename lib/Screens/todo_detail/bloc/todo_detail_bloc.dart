import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/notes_model.dart';

part 'todo_detail_event.dart';
part 'todo_detail_state.dart';

class TodoDetailBloc extends Bloc<TodoDetailEvent, TodoDetailState> {
  TodoDetailBloc() : super(const TodoDetailState()) {
    on<TodoDetailEvent>((event, emit) {});

    on<LoadTask>((event, emit) {
      emit(TodoDetailState(notesModel: event.model));
    });
    on<CheckDoneTask>((event, emit) {
      final model = state.notesModel?.copyWith(isDone: !event.isDone);
      emit(TodoDetailState(notesModel: model));
    });
    on<RemoveTask>((event, emit) {
      log("xoá task");
    });
  }
}
