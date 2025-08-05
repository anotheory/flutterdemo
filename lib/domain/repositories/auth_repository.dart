import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/domain/entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
  
  Future<Either<Failure, AuthEntity>> authenticate({
    required String email,
    required String password,
  });
  
  Future<Either<Failure, AuthEntity>> verifyToken(String token);
}