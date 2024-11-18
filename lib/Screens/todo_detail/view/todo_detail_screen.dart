import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom_view/button_text_view.dart';
import '../../../custom_view/defaul_app_bar.dart';
import '../../../models/notes_model.dart';
import '../../../routes/routes.dart';
import '../bloc/todo_detail_bloc.dart';

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesModel? arguments =
        ModalRoute.of(context)?.settings.arguments as NotesModel?;
    return BlocProvider(
      create: (context) => TodoDetailBloc()..add(LoadTask(arguments!)),
      child: BlocConsumer<TodoDetailBloc, TodoDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = context.read<TodoDetailBloc>();
          return Scaffold(
            appBar: DefaulAppBar(
              title: 'Todo',
              leading: BackButton(
                onPressed: () => Navigator.popAndPushNamed(
                  context,
                  Routes.HOME,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    // chuyen man edit
                    Navigator.pushNamed(
                      context,
                      Routes.EDIT_SCREEN,
                      arguments: state.notesModel,
                    );
                  },
                  icon: const Icon(Icons.edit_outlined),
                )
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.825,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/7.png',
                      scale: 2,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.notesModel?.title}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              state.notesModel?.isDone == false
                                  ? 'Open'
                                  : 'Done',
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Checkbox(
                              value: state.notesModel?.isDone ?? false,
                              onChanged: (value) {
                                bloc.add(CheckDoneTask(
                                    state.notesModel?.isDone ?? false));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Text(
                        '${state.notesModel?.subtitle}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 8),
                    // const Text(
                    //   '10/10/2024 - 16/10/2024',
                    //   style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.normal,
                    //       fontStyle: FontStyle.italic),
                    // ),
                    const SizedBox(height: 16),
                    ButtonTextView(
                      btnName: 'Remove Task',
                      background: Colors.red,
                      onTap: () {
                        bloc.add(RemoveTask(state.notesModel!));
                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.HOME,
                            (route) => false,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
