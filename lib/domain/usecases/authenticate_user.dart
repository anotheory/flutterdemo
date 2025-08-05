import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/usecases/usecase.dart';
import 'package:myapp/domain/entities/auth_entity.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';

class AuthenticateUser implements UseCase<AuthEntity, AuthenticateParams> {
  final AuthRepository repository;

  AuthenticateUser(this.repository);

  @override
  Future<Either<Failure, AuthEntity>> call(AuthenticateParams params) async {
    return await repository.authenticate(
      email: params.email,
      password: params.password,
    );
  }
}

class AuthenticateParams {
  final String email;
  final String password;

  AuthenticateParams({
    required this.email,
    required this.password,
  });
}