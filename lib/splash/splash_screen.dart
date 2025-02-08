import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/components/internet_exception.dart';
import 'package:flutter_bloc_clean/config/routes/components/loading_widget.dart';
import 'package:flutter_bloc_clean/config/routes/components/round_button.dart';

import '../config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              InternetException(onPress: () {})
              // RoundButton(
              //     title: 'Login',
              //     onPressed: () {
              //       Navigator.pushNamed(context, RoutesName.homeScreen);
              //     }),
              // RoundButton(title: 'Signup', onPressed: () {}),
              // // const LoadingWidget(),
              // TextButton(onPressed: () {}, child: const Text('Home')),
            ],
          ),
        ),
      ),
    );
  }
}
