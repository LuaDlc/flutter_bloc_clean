import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean/login/auth/login_repository.dart';
import 'package:flutter_bloc_clean/services/sesssion_manager/session_controller.dart';
import 'package:flutter_bloc_clean/utils/enums.dart';

part 'login_event.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    print(event.email);
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    Map data = {
      "email": state.email,
      "password": state.password,
    };

    emit(state.copyWith(postApiStatus: PostAPiStatus.loading));

    await loginRepository.loginAPi(data).then((value) async {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
            message: value.error.toString(),
            postApiStatus: PostAPiStatus.error));
      } else {
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(
            message: 'login succefull', postApiStatus: PostAPiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: error.toString(), postApiStatus: PostAPiStatus.error));
    });
  }
}
