part of 'login_bloc.dart';

class LoginStates extends Equatable {
  final String email;
  final String password;
  final PostAPiStatus postApiStatus;
  final String message;

  const LoginStates(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.postApiStatus = PostAPiStatus.initial});

  LoginStates copyWith({
    String? email,
    String? password,
    PostAPiStatus? postApiStatus,
    String? error,
  }) {
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      message: error ?? this.message,
    );
  }

  @override
  List<Object?> get props => [email, password, postApiStatus, message];
}
