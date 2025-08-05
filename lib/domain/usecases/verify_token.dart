import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/usecases/usecase.dart';
import 'package:myapp/domain/entities/auth_entity.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';

class VerifyToken implements UseCase<AuthEntity, VerifyTokenParams> {
  final AuthRepository repository;

  VerifyToken(this.repository);

  @override
  Future<Either<Failure, AuthEntity>> call(VerifyTokenParams params) async {
    return await repository.verifyToken(params.token);
  }
}

class VerifyTokenParams {
  final String token;

  VerifyTokenParams({required this.token});
}