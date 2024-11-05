import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../custom_view/button_text_view.dart';
import '../../../../custom_view/custome_text_field_view.dart';
import '../../../../routes/routes.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bloc = context.read<LoginBloc>();
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  Image.asset('assets/7.png'),
                  const SizedBox(height: 16),
                  CustomeTextFieldView(
                    hintText: 'Email',
                    text: state.email,
                    prefixIcon: const Icon(Icons.email_rounded),
                    onChanged: (text) {
                      bloc.add(ChangedEmailEvent(text: text));
                    },
                    errorText: state.emailError,
                  ),
                  const SizedBox(height: 16),
                  CustomeTextFieldView(
                    hintText: 'Password',
                    text: state.password,
                    obscureText: !state.isShowPassword,
                    prefixIcon: const Icon(Icons.key_rounded),
                    suffixIcon: InkWell(
                      onTap: () => bloc.add(ShowPasswordEvent()),
                      child: const Icon(Icons.remove_red_eye_rounded),
                    ),
                    onChanged: (text) {
                      bloc.add(ChangedPasswordEvent(text: text));
                    },
                    errorText: state.passwordError,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.SIGN_UP);
                        },
                        child: const Text(
                          'Sign UP',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  ButtonTextView(
                    btnName: 'Login',
                    background: Colors.red,
                    onTap: () {
                      bloc.add(CheckTextFieldEvent());
                      if (state.email.isNotEmpty && state.password.isNotEmpty) {
                        bloc.add(SignInEvent(context));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
