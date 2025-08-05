class UserEntity {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  const UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  String get fullName => '$firstName $lastName';
}