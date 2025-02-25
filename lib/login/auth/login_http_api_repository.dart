import 'package:flutter_bloc_clean/config/app_url.dart';
import 'package:flutter_bloc_clean/data/exceptions/network_services_api.dart';
import 'package:flutter_bloc_clean/login/auth/login_repository.dart';

import '../../models/user/user_model.dart';

class LoginHttpApiRepository implements LoginRepository {
  final _api = NetworkServicesApi();

  @override
  Future<UserModel> loginAPi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
