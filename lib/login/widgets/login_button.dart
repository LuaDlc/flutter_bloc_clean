import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean/bloc/login_bloc.dart';
import 'package:flutter_bloc_clean/utils/enums.dart';
import 'package:flutter_bloc_clean/utils/flush_bar_helper.dart';

class LoginButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (current, previous) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostAPiStatus.error) {
          FlushBarHelper.flushBarErrorMessage(
              state.message.toString(), context);
        }
        if (state.postApiStatus == PostAPiStatus.success) {
          FlushBarHelper.flushBarSuccessMessage('login succesfull', context);
        }
        if (state.postApiStatus == PostAPiStatus.loading) {
          FlushBarHelper.flushBarErrorMessage('submitting', context);
        }
      },

      //   "email": "eve.holt@reqres.in",
      // "password": "cityslicka"
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current, previous) =>
            current.postApiStatus != previous.postApiStatus,
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginApi());
                }
              },
              child: state.postApiStatus == PostAPiStatus.loading
                  ? const CircularProgressIndicator()
                  : const Text('login'));
        },
      ),
    );
  }
}
