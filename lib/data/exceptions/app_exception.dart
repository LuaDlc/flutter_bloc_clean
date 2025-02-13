class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message$_prefix'; //return the formatted error message
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, '');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'You dont have access to this');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message])
      : super(message, 'request time out');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'r');
}
