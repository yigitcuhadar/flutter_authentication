import '../models/user.dart';

abstract class AuthenticationRepository {
  Stream<User?> get user;

  Future<void> init();

  Future<User> login({
    required String email,
    required String password,
  });

  Future<User> loginWithGoogle();

  Future<User> register({
    required String email,
    required String password,
  });

  Future<void> sendVerificationLink();

  Future<void> deleteUser();

  Future<void> logout();

  Future<void> reload();
}
