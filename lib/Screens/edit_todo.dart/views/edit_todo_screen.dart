import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom_view/button_text_view.dart';
import '../../../custom_view/custome_text_field_view.dart';
import '../../../custom_view/defaul_app_bar.dart';
import '../../../models/notes_model.dart';
import '../../../styles/this_colos.dart';
import '../bloc/edit_todo_bloc.dart';

class EditTodoScreen extends StatelessWidget {
  const EditTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesModel? arguments =
        ModalRoute.of(context)?.settings.arguments as NotesModel?;

    return BlocProvider(
      create: (context) => EditTodoBloc()..add(LoadTask(model: arguments)),
      child: BlocConsumer<EditTodoBloc, EditTodoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final bloc = context.read<EditTodoBloc>();
          return Scaffold(
            appBar: const DefaulAppBar(
              title: 'New Todo',
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Title',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomeTextFieldView(
                    hintText: 'Title Todo',
                    text: state.title,
                    onChanged: (text) {
                      bloc.add(ChangedTitleEvent(text: text));
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomeTextFieldView(
                    hintText: 'Description',
                    text: state.description,
                    onChanged: (text) {
                      bloc.add(ChangedDescriptionEvent(text: text));
                    },
                    minLines: 3,
                    maxLines: 10,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ButtonTextView(
                          btnName: 'Cancel',
                          background: Colors.red,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ButtonTextView(
                          btnName: arguments != null ? 'Update' : 'Add',
                          background: ThisColors.mainColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
