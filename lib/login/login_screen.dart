import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/models/user/user_model.dart';
import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserModel userModel = UserModel();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
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
        ));
  }
}
