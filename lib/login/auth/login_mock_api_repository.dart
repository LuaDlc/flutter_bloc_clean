import 'package:flutter_bloc_clean/data/exceptions/network_services_api.dart';
import 'package:flutter_bloc_clean/login/auth/login_repository.dart';

import '../../models/user/user_model.dart';

class LoginMockApiRepository implements LoginRepository {
  final _api = NetworkServicesApi();
  Future<UserModel> loginAPi(dynamic data) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = {'token': 'sdashjk78'};
    return UserModel.fromJson(response);
  }
}
