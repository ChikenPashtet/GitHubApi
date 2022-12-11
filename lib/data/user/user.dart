import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class User {
  User(
    this.name,
    this.avatarUrl,
    this.id,
    this.email,
    this.company,
    this.login,
    this.bio,
  );

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  final String name;
  final String avatarUrl;
  final int id;
  final String? email;
  final String login;
  final String? company;
  final String? bio;
}
