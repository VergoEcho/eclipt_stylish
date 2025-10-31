sealed class Error implements Exception {
  final String message;

  Error([String? message]) : message = message ?? 'Something went wrong';

  @override
  String toString() => 'Error: $message';

  static String handle(Object? error) {
    if (error is! Error) return DefaultError().message;
    return error.toString();
  }
}

final class DefaultError extends Error {
  DefaultError([super.message]);
}

final class NetworkError extends Error {
  NetworkError([super.message]);

  @override
  String toString() => 'Network error: $message';
}

final class AuthError extends Error {
  AuthError([super.message]);

  @override
  String toString() => 'Auth error: $message';
}

final class ServerError extends Error {
  ServerError([super.message]);

  @override
  String toString() => 'Server error: $message';
}
