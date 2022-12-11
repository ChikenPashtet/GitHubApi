import 'package:json_annotation/json_annotation.dart';

part 'following.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class Following {
  const Following(
    this.avatarUrl,
    this.login,
    this.id,
  );

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);

  final String avatarUrl;
  final String login;
  final int id;

  static List<Following> listFromJson(dynamic json) {
    return json.map((e) => Following.fromJson(e)).toList().cast<Following>();
  }
}
