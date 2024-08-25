sealed class LoginException implements Exception {
  final String? message;
  const LoginException(this.message);

  factory LoginException.fromCode(String code, String? message) {
    switch (code) {
      case 'invalid-email':
        return LoginInvalidEmail(message);
      case 'user-disabled':
        return LoginUserDisabled(message);
      case 'user-not-found':
        return LoginUserNotFound(message);
      case 'wrong-password':
        return LoginWrongPassword(message);
      case 'invalid-credential':
        return LoginInvalidCredential(message);
      default:
        return LoginUnknown(message);
    }
  }
}

class LoginInvalidEmail extends LoginException {
  const LoginInvalidEmail(super.message);
}

class LoginUserDisabled extends LoginException {
  const LoginUserDisabled(super.message);
}

class LoginUserNotFound extends LoginException {
  const LoginUserNotFound(super.message);
}

class LoginWrongPassword extends LoginException {
  const LoginWrongPassword(super.message);
}

class LoginInvalidCredential extends LoginException {
  const LoginInvalidCredential(super.message);
}

class LoginUnknown extends LoginException {
  const LoginUnknown(super.message);
}
