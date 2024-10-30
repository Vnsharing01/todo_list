import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom_view/defaul_app_bar.dart';
import '../../../routes/routes.dart';
import '../bloc/home_bloc.dart';
import 'components/todo_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadTask()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
        
        },
        builder: (context, state) {
          var bloc = context.read<HomeBloc>();
          log("listTask: ${state.listTask?.length}");
          log("listOpen: ${state.listTaskOpen?.length}");
          log("listDone: ${state.listTaskDone?.length}");
          return Scaffold(
            appBar: const DefaulAppBar(
              title: 'Todo',
              isShowLeading: false,
            ),
            body: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TabBar.secondary(controller: _tabController, tabs: const [
                      Tab(
                        text: 'Task',
                        icon: Icon(Icons.line_style_rounded),
                      ),
                      Tab(
                        text: 'Done',
                        icon: Icon(Icons.domain_verification_rounded),
                      ),
                    ]),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          TodoListView(
                            bloc: bloc,
                            state: state,
                            listTask: state.listTaskOpen ?? [],
                          ),
                          TodoListView(
                            bloc: bloc,
                            state: state,
                            listTask: state.listTaskDone ?? [],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.EDIT_SCREEN);
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add_outlined),
            ),
          );
        },
      ),
    );
  }
}

