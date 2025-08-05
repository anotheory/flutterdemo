import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/exceptions.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/network/network_info.dart';
import 'package:myapp/data/datasources/auth_remote_data_source.dart';
import 'package:myapp/domain/entities/auth_entity.dart';
import 'package:myapp/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthEntity>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.register(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        );
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> authenticate({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.authenticate(
          email: email,
          password: password,
        );
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> verifyToken(String token) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.verifyToken(token);
        return Right(result);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure('No internet connection'));
    }
  }
}