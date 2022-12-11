import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class Repository {
  const Repository(
    this.language,
    this.name,
    this.id,
    this.forks,
    this.stargazersCount,
  );

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);

  final String? language;
  final String name;
  final int id;
  final int forks;
  final int stargazersCount;

  static List<Repository> listFromJson(dynamic json) {
    return json.map((e) => Repository.fromJson(e)).toList().cast<Repository>();
  }
}
