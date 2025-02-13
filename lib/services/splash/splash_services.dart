import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/routes_name.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(context,
            RoutesName.loginScreen as Route<Object?>, (route) => false));
  }
}
