import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_client.dart';
import '../../../models/notes_model.dart';
import '../../../routes/routes.dart';
import '../repository/edit_todo_repository.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  final logger = Logger();
  final repository = EditTodoRepository(ApiClient());
  EditTodoBloc() : super(EditTodoInitial()) {
    on<EditTodoEvent>((event, emit) {});

    on<LoadTask>((event, emit) {
      emit(EditTodoState(
        title: event.model?.title ?? '',
        description: event.model?.subtitle ?? '',
      ));
    });

    on<ChangedTitleEvent>((event, emit) {
      emit(state.coppyWith(title: event.text));
    });

    on<ChangedDescriptionEvent>((event, emit) {
      emit(state.coppyWith(description: event.text));
    });

    on<AddNewTask>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = await addNewTaskState(
          event.model!.copyWith(userId: prefs.getString('UserId')));
      if (data != null) {
        Future.delayed(
          const Duration(milliseconds: 100),
          () => Navigator.pushNamedAndRemoveUntil(
            event.context,
            Routes.HOME,
            (route) => false,
          ),
        );
      }
      emit(EditTodoState(
        title: event.model?.title ?? '',
        description: event.model?.subtitle ?? '',
      ));
    });

    on<UpdateTask>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final data = await updateTaskState(
          event.model!.copyWith(userId: prefs.getString('UserId')));
      if (data != null) {
        Future.delayed(
          const Duration(milliseconds: 100),
          () => Navigator.popAndPushNamed(
            event.context,
            Routes.DETAIL,
            arguments: data,
          ),
        );
      }
      emit(EditTodoState(
        title: event.model?.title ?? '',
        description: event.model?.subtitle ?? '',
      ));
    });
  }

  Future addNewTaskState(NotesModel model) async {
    final data = await repository.newTask(model);
    return data;
  }

  Future updateTaskState(NotesModel model) async {
    final data = await repository.updateTask(model);
    return data;
  }
}
