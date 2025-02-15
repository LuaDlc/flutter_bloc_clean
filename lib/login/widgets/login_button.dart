import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean/bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (state.password.length < 6) {
                  print('please enter a valid passowrd');
                }
              }
            },
            child: const Text('login'));
      },
    );
  }
}
