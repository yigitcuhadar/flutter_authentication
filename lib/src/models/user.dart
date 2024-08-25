import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isEmailVerified,
    required this.phoneNumber,
    required this.photoURL,
  });

  final String id;
  final String? name;
  final String email;
  final bool isEmailVerified;
  final String? phoneNumber;
  final String? photoURL;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        isEmailVerified,
        phoneNumber,
        photoURL,
      ];
}
