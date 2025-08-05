import 'package:myapp/data/models/user/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
  
  Future<AuthModel> authenticate({
    required String email,
    required String password,
  });
  
  Future<AuthModel> verifyToken(String token);
}