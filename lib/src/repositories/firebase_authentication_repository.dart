import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../models/models.dart';
import 'authentication_repository.dart';

extension FirebaseUserExtension on auth.User {
  User get toUser {
    return User(
      id: uid,
      name: displayName,
      email: email!,
      isEmailVerified: emailVerified,
      phoneNumber: phoneNumber,
      photoURL: photoURL,
    );
  }
}

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  auth.User? lastUser;

  @override
  Stream<User?> get user => auth.FirebaseAuth.instance.userChanges().map((auth.User? user) {
        lastUser = user;
        return user?.toUser;
      });

  @override
  Future<void> init() async {}

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final auth.UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.toUser;
    } on auth.FirebaseAuthException catch (e) {
      throw LoginException.fromCode(e.code, e.message);
    } catch (e) {
      throw LoginUnknown('$e');
    }
  }

  @override
  Future<User> loginWithGoogle() {
    // TODO
    throw UnimplementedError();
  }

  @override
  Future<User> register({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _firebaseAuth.currentUser!.toUser;
    } on auth.FirebaseAuthException catch (e) {
      throw RegisterException.fromCode(e.code, e.message);
    } catch (e) {
      throw LoginUnknown('$e');
    }
  }

  @override
  Future<void> sendVerificationLink() async {
    try {
      await lastUser?.sendEmailVerification();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteUser() async {
    try {
      await lastUser?.delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> reload() async {
    try {
      await lastUser?.reload();
    } catch (e) {
      rethrow;
    }
  }
}
