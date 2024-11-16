import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_list/styles/this_colos.dart';

import '../../../../custom_view/dialog/notifi_dialog.dart';
import '../../../../models/notes_model.dart';
import '../../../../routes/routes.dart';
import '../../bloc/home_bloc.dart';
import 'todo_card_view.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({
    super.key,
    required this.bloc,
    required this.state,
    required this.listTask,
  });

  final HomeBloc bloc;
  final HomeState state;
  final List<NotesModel> listTask;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      itemCount: listTask.length,
      itemBuilder: (context, index) {
        var item = listTask[index];
        return listTask.isNotEmpty
            ? TodoCardView(
                titleTask: item.title ?? '',
                content: item.subtitle ?? '',
                imgTaskUrl: '',
                isDone: item.isDone!,
                onChanged: (value) {
                  bloc.add(CheckDoneTask(item));
                },
                onTap: () {
                  Navigator.pushNamed(context, Routes.DETAIL, arguments: item);
                },
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => NotifiDialog(
                      title: 'Bạn chắc chắn muốn xoá?',
                      btnName: 'Remove Task',
                      background: Colors.red,
                      onOK: () {
                        bloc.add(RemoveTask(item));
                        Navigator.pop(context);
                        bloc.add(LoadTask());
                        Future.delayed(const Duration(milliseconds: 100), () {
                          Fluttertoast.showToast(
                            msg: 'Đã xoá Task',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            textColor: Colors.white,
                            fontSize: 16.0,
                            backgroundColor: ThisColors.mainColor,
                          );
                        });
                      },
                    ),
                  );
                },
              )
            : const Center(child: Text(' Specifications tab'));
      },
    );
  }
}
