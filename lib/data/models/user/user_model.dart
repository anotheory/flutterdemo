import 'package:myapp/data/models/generated/lib/data/protos/user.pb.dart';
import 'package:myapp/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.firstName,
    required super.lastName,
  });

  factory UserModel.fromProto(User proto) {
    return UserModel(
      id: proto.id,
      email: proto.email,
      firstName: proto.firstName,
      lastName: proto.lastName,
    );
  }

  User toProto() {
    return User()
      ..id = id
      ..email = email
      ..firstName = firstName
      ..lastName = lastName;
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
    );
  }
}