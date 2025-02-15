import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean/bloc/login_bloc.dart';
import 'package:flutter_bloc_clean/models/user/user_model.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserModel userModel = UserModel();
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: BlocProvider(
          create: (context) => _loginBloc,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailInputWidget(emailFocusNode: emailFocusNode),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInputWidget(passwordFocusNode: passwordFocusNode),
                    LoginButton(
                      formKey: _formKey,
                    )
                  ],
                )),
          ),
        ));
  }
}
