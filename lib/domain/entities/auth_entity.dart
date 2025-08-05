import 'user_entity.dart';

class AuthEntity {
  final bool success;
  final String message;
  final String? token;
  final UserEntity? user;

  const AuthEntity({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });
}