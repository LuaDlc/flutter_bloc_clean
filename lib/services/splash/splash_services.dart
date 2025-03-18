import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean/config/routes/routes_name.dart';
import 'package:flutter_bloc_clean/services/sesssion_manager/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreference().then((value) {
      if (SessionController().isLogin ?? false) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
                RoutesName.homeScreen as Route<Object?>, (route) => false));
      } else {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context,
                RoutesName.loginScreen as Route<Object?>, (route) => false));
      }
    }).onError((error, stackTrace) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushAndRemoveUntil(context,
              RoutesName.loginScreen as Route<Object?>, (route) => false));
    });
  }
}
