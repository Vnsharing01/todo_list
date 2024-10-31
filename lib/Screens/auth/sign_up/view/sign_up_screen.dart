import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../../custom_view/button_text_view.dart';
import '../../../../custom_view/custome_text_field_view.dart';
import '../../../../custom_view/defaul_app_bar.dart';
import '../../../../routes/routes.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = Logger();
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bloc = context.read<SignUpBloc>();
        return SafeArea(
          child: Scaffold(
            appBar: const DefaulAppBar(title: 'SignUp'),
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
                    hintText: 'Name',
                    text: state.name,
                    prefixIcon: const Icon(Icons.email_rounded),
                    onChanged: (text) {
                      bloc.add(ChangedNameEvent(text: text));
                    },
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
                  ButtonTextView(
                    btnName: 'Sign Up',
                    background: Colors.red,
                    onTap: () async {
                      bloc.add(CheckTextFieldEvent());
                      if (state.email.isNotEmpty && state.password.isNotEmpty) {
                        bloc.add(RegisterEvent(
                          context,
                          email: state.email,
                          password: state.password,
                        ));
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
