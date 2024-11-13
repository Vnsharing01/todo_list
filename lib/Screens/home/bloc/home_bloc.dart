import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:todo_list/Screens/home/repository/home_repository.dart';

import '../../../api/api_client.dart';
import '../../../models/notes_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final logger = Logger();
  final dio = Dio();
  final repository = HomeRepository(ApiClient());
  HomeBloc() : super(const HomeState(listTask: <NotesModel>[])) {
    on<LoadTask>((event, emit) async {
      var listOpen = <NotesModel>[];
      var listDone = <NotesModel>[];
      final allTask = await getAllTask();
      if (allTask.isNotEmpty) {
        for (NotesModel model in allTask) {
          if (model.isDone == false) {
            listOpen.add(model);
          } else {
            listDone.add(model);
          }
        }
      }
      emit(HomeState(
        listTask: allTask,
        listTaskOpen: listOpen,
        listTaskDone: listDone,
      ));
    });

    on<CheckDoneTask>((event, emit) async {
      var listOpen = <NotesModel>[];
      var listDone = <NotesModel>[];
      var listTask = <NotesModel>[];
      final task = await updateTaskState(event.model);
      if (task != null) {
        listTask = state.listTask!.map(
          (model) {
            if (model.id == task.id) {
              return model.copyWith(isDone: task.isDone);
            }
            return model;
          },
        ).toList();

        for (var model in listTask) {
          if (model.isDone == false) {
            listOpen.add(model);
          } else {
            listDone.add(model);
          }
        }
      }

      emit(HomeState(
        listTask: listTask,
        listTaskOpen: listOpen,
        listTaskDone: listDone,
      ));
    });

    on<RemoveTask>((event, emit) async {
      var listOpen = <NotesModel>[];
      var listDone = <NotesModel>[];
      var listTask = <NotesModel>[];
      final res = await deleteTask(event.model);
      if (res != null) {
        listTask = state.listTask!;
        listTask.remove(res);

        for (var model in listTask) {
          if (model.isDone == false) {
            listOpen.add(model);
          } else {
            listDone.add(model);
          }
        }
        const SnackBar(content: Text('Bạn đã xoá task'));
      }
      emit(HomeState(
        listTask: listTask,
        listTaskOpen: listOpen,
        listTaskDone: listDone,
      ));
    });
  }

  Future getAllTask() async {
    final res = await repository.getAllListTodo();

    if (res.isNotEmpty) {
      return res;
    }
    return null;
  }

  Future updateTaskState(NotesModel model) async {
    final data = await repository.updateTask(model);
    return data;
  }

  Future deleteTask(NotesModel model) async {
    final data = await repository.removeTask(model);
    return data;
  }
}
