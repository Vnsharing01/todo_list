import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/notes_model.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  EditTodoBloc() : super(EditTodoInitial()) {
    on<EditTodoEvent>((event, emit) {
      // TODO: implement event handler
    });
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
  }
}
