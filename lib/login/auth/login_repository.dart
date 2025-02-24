import 'package:flutter_bloc_clean/config/app_url.dart';
import 'package:flutter_bloc_clean/data/exceptions/network_services_api.dart';

import '../../models/user/user_model.dart';

class LoginRepository {
  final _api = NetworkServicesApi();
  Future<UserModel> loginAPi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}
