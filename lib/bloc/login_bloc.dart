import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_clean/login/auth/login_repository.dart';
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

    await loginRepository.loginAPi(data).then((value) {
      if (value.error.isNotEmpty) {
        print('I am here');
        emit(state.copyWith(
            error: 'login succefull', postApiStatus: PostAPiStatus.success));
      } else {
        emit(state.copyWith(
            error: value.error.toString(), postApiStatus: PostAPiStatus.error));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          error: error.toString(), postApiStatus: PostAPiStatus.error));
    });
  }
}
