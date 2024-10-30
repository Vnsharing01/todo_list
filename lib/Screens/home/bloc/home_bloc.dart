import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/notes_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(listTask: <NotesModel>[])) {
    final tasks = [
      NotesModel(
        id: '0',
        image: 0,
        isDon: true,
        title: 'check app',
        subtitle: 'ﾒｯﾁｬ(*ෆ ·̫ ෆ*)ｶﾜｲｲ♥️パンダ🐼大ｯ好き💗🐼に囲まれて幸せだね〜🐼',
      ),
      NotesModel(
        id: '1',
        image: 0,
        isDon: false,
        title: 'code app',
        subtitle: '很多熊猫，都很可爱！但是小柔是最可爱的熊猫！！',
      ),
      NotesModel(
        id: '2',
        image: 0,
        isDon: false,
        title: 'code app 2',
        subtitle: 'めっちゃ可愛すぎる♡♡♡',
      ),
      NotesModel(
        id: '3',
        image: 0,
        isDon: true,
        title: 'I love Xiao Rou',
        subtitle: '(ᐡ ̳>𖥦< ̳ᐡ)♡ｷｭﾝｷｭﾝ💞🫰🏻💗(՞ ⸝⸝> ̫ <⸝⸝ ՞)ｶﾜﾕｽ',
      ),
      NotesModel(
        id: '4',
        image: 0,
        isDon: true,
        title: 'I love you Seeu',
        subtitle: '我从2020年就认识你了seeU，你像兔子一样甜蜜❤️',
      )
    ];
    on<LoadTask>((event, emit) {
      var listOpen = <NotesModel>[];
      var listDone = <NotesModel>[];
      if (tasks.isNotEmpty) {
        for (var model in tasks) {
          if (model.isDon == false) {
            listOpen.add(model);
          } else {
            listDone.add(model);
          }
        }
      }
      emit(HomeState(
        listTask: tasks,
        listTaskOpen: listOpen,
        listTaskDone: listDone,
      ));
    });

    on<CheckDoneTask>((event, emit) {
      var listOpen = <NotesModel>[];
      var listDone = <NotesModel>[];

      var listTask = state.listTask?.map(
        (model) {
          if (model.id == event.model.id) {
            return model.copyWith(isDon: !event.model.isDon!);
          }
          return model;
        },
      ).toList();

      if (listTask != null) {
        for (var model in listTask) {
          if (model.isDon == false) {
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

    on<RemoveTask>((event, emit) {
      log("xoá task");
    });
  }
}
