import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Screens/auth/login/bloc/login_bloc.dart';
import 'Screens/auth/sign_up/bloc/sign_up_bloc.dart';
import 'routes/app_route.dart';
import 'routes/routes.dart';
import 'styles/this_colos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: 'AIzaSyArKhPr44580fcA0CgbGeuVjThIl3HdDTw',
    appId: '...',
    messagingSenderId: 'sendid',
    projectId: 'todo-list-871f3',
    storageBucket: 'todo-list-871f3.appspot.com',
  ));
  runApp(TodoApp(
    appRoute: AppRoute(),
  ));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key, required this.appRoute});
  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ThisColors.mainColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.onPageRoute,
        initialRoute: Routes.LOGIN,
        builder: EasyLoading.init(),
      ),
    );
  }
}
