import 'package:myapp/data/models/generated/lib/data/protos/user.pb.dart';
import 'package:myapp/domain/entities/auth_entity.dart';
import 'package:myapp/domain/entities/user_entity.dart';

import 'user_model.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required bool success,
    required String message,
    String? token,
    UserEntity? user,
  }) : super(
          success: success,
          message: message,
          token: token,
          user: user,
        );

  factory AuthModel.fromRegisterResponse(RegisterResponse response) {
    return AuthModel(
      success: response.success,
      message: response.message,
      token: response.token.isNotEmpty ? response.token : null,
    );
  }

  factory AuthModel.fromAuthenticateResponse(AuthenticateResponse response) {
    return AuthModel(
      success: response.success,
      message: response.message,
      token: response.token.isNotEmpty ? response.token : null,
    );
  }

  factory AuthModel.fromVerifyTokenResponse(VerifyTokenResponse response) {
    return AuthModel(
      success: response.valid,
      message: response.message,
      user: response.hasUser() ? UserModel.fromProto(response.user) : null,
    );
  }
}