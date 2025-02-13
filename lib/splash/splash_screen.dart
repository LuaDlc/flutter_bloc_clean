import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/data/exceptions/app_exception.dart';
import 'package:flutter_bloc_clean/services/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        throw NoInternetException('NO internet exception');
      }),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const SafeArea(
        child: Center(child: Text('Splash  Screen')
            // Column(
            //   children: [
            //     // InternetException(onPress: () {})
            //     RoundButton(
            //         title: 'Login',
            //         onPressed: () {
            //           Navigator.pushNamed(context, RoutesName.homeScreen);
            //         }),
            //     RoundButton(title: 'Signup', onPressed: () {}),
            //     // const LoadingWidget(),
            //     TextButton(onPressed: () {}, child: const Text('Home')),
            //   ],
            // ),
            ),
      ),
    );
  }
}
