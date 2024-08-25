sealed class GoogleLoginException implements Exception {
  final String? message;
  const GoogleLoginException(this.message);

  factory GoogleLoginException.fromCode(String code, String? message) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return GoogleLoginAccountExistsWithDifferentCredential(message);
      case 'invalid-credential':
        return GoogleLoginInvalidCredential(message);
      case 'operation-not-allowed':
        return GoogleLoginOperationNotAllowed(message);
      case 'user-disabled':
        return GoogleLoginUserDisabled(message);
      case 'user-not-found':
        return GoogleLoginUserNotFound(message);
      case 'wrong-password':
        return GoogleLoginWrongPassword(message);
      case 'invalid-verification-code':
        return GoogleLoginInvalidVerificationCode(message);
      case 'invalid-verification-id':
        return GoogleLoginInvalidVerificationId(message);
      default:
        return GoogleLoginUnknown(message);
    }
  }
}

class GoogleLoginAccountExistsWithDifferentCredential extends GoogleLoginException {
  const GoogleLoginAccountExistsWithDifferentCredential(super.message);
}

class GoogleLoginInvalidCredential extends GoogleLoginException {
  const GoogleLoginInvalidCredential(super.message);
}

class GoogleLoginOperationNotAllowed extends GoogleLoginException {
  const GoogleLoginOperationNotAllowed(super.message);
}

class GoogleLoginUserDisabled extends GoogleLoginException {
  const GoogleLoginUserDisabled(super.message);
}

class GoogleLoginUserNotFound extends GoogleLoginException {
  const GoogleLoginUserNotFound(super.message);
}

class GoogleLoginWrongPassword extends GoogleLoginException {
  const GoogleLoginWrongPassword(super.message);
}

class GoogleLoginInvalidVerificationCode extends GoogleLoginException {
  const GoogleLoginInvalidVerificationCode(super.message);
}

class GoogleLoginInvalidVerificationId extends GoogleLoginException {
  const GoogleLoginInvalidVerificationId(super.message);
}

class GoogleLoginUnknown extends GoogleLoginException {
  const GoogleLoginUnknown(super.message);
}
