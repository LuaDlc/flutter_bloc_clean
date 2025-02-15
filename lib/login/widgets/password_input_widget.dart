// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean/bloc/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({
    super.key,
    required this.passwordFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (previous, current) => current.password != previous.password,
      builder: (context, state) {
        print('password bui;d');
        return TextFormField(
          keyboardType: TextInputType.text,
          focusNode: passwordFocusNode,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Password', border: OutlineInputBorder()),
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return 'please enter a valid password';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
