sealed class RegisterException implements Exception {
  final String? message;
  const RegisterException(this.message);

  factory RegisterException.fromCode(String code, String? message) {
    switch (code) {
      case 'email-already-in-use':
        return RegisterEmailAlreadyInUse(message);
      case 'invalid-email':
        return RegisterInvalidEmail(message);
      case 'operation-not-allowed':
        return RegisterOperationNotAllowed(message);
      case 'weak-password':
        return RegisterWeakPassword(message);
      default:
        return RegisterUnknown(message);
    }
  }
}

class RegisterInvalidEmail extends RegisterException {
  const RegisterInvalidEmail(super.message);
}

class RegisterEmailAlreadyInUse extends RegisterException {
  const RegisterEmailAlreadyInUse(super.message);
}

class RegisterOperationNotAllowed extends RegisterException {
  const RegisterOperationNotAllowed(super.message);
}

class RegisterWeakPassword extends RegisterException {
  const RegisterWeakPassword(super.message);
}

class RegisterUnknown extends RegisterException {
  const RegisterUnknown(super.message);
}
