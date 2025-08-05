import 'package:grpc/grpc.dart';
import 'package:myapp/core/error/exceptions.dart';
import 'package:myapp/data/models/generated/lib/data/protos/user.pbgrpc.dart';
import 'package:myapp/data/models/user/auth_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final UserAuthenticationClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthModel> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final request = RegisterRequest()
        ..email = email
        ..password = password
        ..firstName = firstName
        ..lastName = lastName;

      print('Attempting to register user: $email'); // Debug log
      
      final response = await client.register(request);
      
      print('Registration response received: ${response.success}'); // Debug log
      
      return AuthModel.fromRegisterResponse(response);
    } on GrpcError catch (e) {
      print('gRPC Error: ${e.code} - ${e.message}'); // Debug log
      throw ServerException(_mapGrpcErrorMessage(e));
    } catch (e) {
      print('Unexpected error: $e'); // Debug log
      throw ServerException('Connection failed: $e');
    }
  }

  @override
  Future<AuthModel> authenticate({
    required String email,
    required String password,
  }) async {
    try {
      final request = AuthenticateRequest()
        ..email = email
        ..password = password;

      print('Attempting to authenticate user: $email'); // Debug log

      final response = await client.authenticate(request);
      
      print('Authentication response received: ${response.success}'); // Debug log
      
      return AuthModel.fromAuthenticateResponse(response);
    } on GrpcError catch (e) {
      print('gRPC Error: ${e.code} - ${e.message}'); // Debug log
      throw ServerException(_mapGrpcErrorMessage(e));
    } catch (e) {
      print('Unexpected error: $e'); // Debug log
      throw ServerException('Connection failed: $e');
    }
  }

  @override
  Future<AuthModel> verifyToken(String token) async {
    try {
      final request = VerifyTokenRequest()..token = token;
      
      print('Attempting to verify token'); // Debug log
      
      final response = await client.verifyToken(request);
      
      print('Token verification response received: ${response.valid}'); // Debug log
      
      return AuthModel.fromVerifyTokenResponse(response);
    } on GrpcError catch (e) {
      print('gRPC Error: ${e.code} - ${e.message}'); // Debug log
      throw ServerException(_mapGrpcErrorMessage(e));
    } catch (e) {
      print('Unexpected error: $e'); // Debug log
      throw ServerException('Connection failed: $e');
    }
  }

  String _mapGrpcErrorMessage(GrpcError error) {
    switch (error.code) {
      case StatusCode.unavailable:
        return 'Server is unavailable. Please check your connection and try again.';
      case StatusCode.deadlineExceeded:
        return 'Request timeout. Please try again.';
      case StatusCode.unauthenticated:
        return 'Invalid credentials';
      case StatusCode.alreadyExists:
        return 'User already exists';
      case StatusCode.notFound:
        return 'User not found';
      case StatusCode.invalidArgument:
        return 'Invalid input data';
      case StatusCode.internal:
        return 'Internal server error. Please try again later.';
      case StatusCode.permissionDenied:
        return 'Permission denied';
      default:
        return error.message ?? 'Unknown error occurred';
    }
  }
}